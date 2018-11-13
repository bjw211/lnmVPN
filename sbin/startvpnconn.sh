#!/bin/sh
# +-----------------------------------------------------------------------+
# |       Author: Cheng Wenfeng   <277546922@qq.com>                      |
# +-----------------------------------------------------------------------+
#
wkdir=$(cd $(dirname $0); pwd)
if [ ! -f $wkdir/main.py ] ;then
   wkdir=$(cd $(dirname $0)/../; pwd)
fi
PATH=$PATH:$wkdir/sbin
myapp=$(which openconnect)
confdir="$wkdir/plugins/ocserv"
pidfile="$wkdir/plugins/ocserv/run/openconn.pid"

devname="tun1000"

declare -A uDict
function toDict() {
   uDict=()
   ValueArry=$(grep "^$2" $1|sed "s/^${2}=//g"|grep -Po '(?<=\()[^)]+(?=\))')
   for x in $ValueArry ;do
        key=$(echo $x|awk -F= '{print $1}')
        value=$(echo $x|awk -F= '{print $2}'|sed 's/"//g')
        uDict+=(["$key"]=$value)
   done
}

#获取客户端配置信息
for servID in $(awk -F= '/^openconn_conf/{print $1}' $confdir/ocserv_client.conf);do
    toDict $confdir/ocserv_client.conf $servID
    if [ ${uDict["authtype"]} = "1" ];then
       server=${uDict["ipaddr"]}
       servport=${uDict["servport"]}
       vpnuser=${uDict["vpnuser"]}
       vpnpass=${uDict["vpnpass"]}
   fi
done

if [ -x $wkdir/sbin/vpnc-script ];then
   script="-s $wkdir/sbin/vpnc-script"
fi

OPTIONS="-u $vpnuser --no-dtls $server:$servport --interface=$devname $script --reconnect-timeout 10 --no-cert-check --syslog"

case "$1" in
  start)
        echo -en "Starting VPNConnServer:\t\t"
        /sbin/modprobe tun >/dev/null 2>&1
        $wkdir/sbin/start-stop-daemon --start -m -p $pidfile --exec $myapp -- $OPTIONS <<< $vpnpass -b >/dev/null 2>&1
        RETVAL=$?
        #echo
        if [ $RETVAL -eq 0 ] ;then
	   echo "Done..."
	else
	   echo "Failed"
	fi
        ;;
  stop)
	echo -en "Stoping VPNConnServer:\t\t"
	$wkdir/sbin/start-stop-daemon --stop  --name openconnect >/dev/null 2>&1
	RETVAL=$?
        #echo
	$wkdir/sbin/startnetworks.sh restart >/dev/null 2>&1
        if [ $RETVAL -eq 0 ] ;then
	   echo "Done..."
	else
	   echo "Failed"
	fi
        ;;
  status)
        for pid in  $( ps ax|grep openconnect |grep -v 'grep'|awk '{print $1}');do
	   echo $pid
	done
        ;;
  restart)
        $0 stop
        $0 start
        RETVAL=$?
        ;;
  *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 2
esac
