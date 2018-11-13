%rebase base position='添加VPN服务配置', managetopli="vpnserv"
<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="widget">
                <div class="widget-header bordered-bottom bordered-themesecondary">
                    <i class="widget-icon fa fa-tags themesecondary"></i>
                    <span class="widget-caption themesecondary">添加配置</span>
                    <div class="widget-buttons">
                        <a href="#" data-toggle="maximize">
                            <i class="fa fa-expand"></i>
                        </a>
                        <a href="#" data-toggle="collapse">
                            <i class="fa fa-minus"></i>
                        </a>
                        <a href="#" data-toggle="dispose">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                    
                </div><!--Widget Header-->
                <div style="padding:-10px 0px;" class="widget-body no-padding">
                  <form action="" method="post">
		    <div class="modal-body">
                        <div class="input-group">
                           <span class="input-group-addon">验证方式&emsp;</span>
                           <select style="width:420px" class="form-control" name="authtype">
				<option 
                                %if info.get('authtype','') == 2:
                                        selected
                                %end 
                                value="2">支持证书+密码认证          
                                </option>
                                <option 
				%if info.get('authtype','') == 0:
					selected
				%end 
                                        value="0">证书认证
                                </option>
                                <option 
				%if info.get('authtype','') == 1:
                                        selected
                                %end 
                                        value="1">密码认证
                                </option>
                            </select>
                        </div>
                   </div>
		    <div class="modal-body">
                        <div class="input-group">
                          <span class="input-group-addon">监听信息&emsp;</span>
			  <input type="text" style="width:210px" class="form-control" id="" name="ipaddr" onkeyup="this.value=this.value.replace(/[^\d.*]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" placeholder="IP地址" aria-describedby="inputGroupSuccess4Status"
			   %if info.get('ipaddr',''): 
                                value="{{info.get('ipaddr','')}}"
                           %else :
                                value="*"
                           %end 
			  >
			  <input type="text" style="width:210px" class="form-control" id="" name="servport" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" placeholder="监听端口" aria-describedby="inputGroupSuccess4Status" 
			   %if info.get('servport',''): 
			   	value="{{info.get('servport','')}}"
			   %else :
				value="443"
			   %end 
			   >
                        </div>
                    </div>
		    <div class="modal-body">
                        <div class="input-group">
                          <span class="input-group-addon">虚拟网络段</span>
                          <input type="text" style="width:210px" class="form-control" id="" name="virip" onkeyup="this.value=this.value.replace(/[^\d.]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" placeholder="虚拟IP" aria-describedby="inputGroupSuccess4Status"
			  %if info.get('virip',''): 
                                value="{{info.get('virip','')}}"
                           %else :
                                value="66.66.6.0"
                           %end 
			  >
                          <input type="text" style="width:210px" class="form-control" id="" name="virmask" onkeyup="this.value=this.value.replace(/[^\d.]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" placeholder="子网掩码" aria-describedby="inputGroupSuccess4Status"
			  %if info.get('virmask',''): 
                                value="{{info.get('virmask','')}}"
                           %else :
                                value="255.255.255.0"
                           %end 
                           >
                        </div>
                    </div>
		    <div class="modal-body">
                        <div class="input-group">
                          <span class="input-group-addon">连接数控制</span>
                          <input type="text" style="width:210px" class="form-control" id="" name="maxclient" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" placeholder="最大连接数" aria-describedby="inputGroupSuccess4Status" 
			  %if info.get('maxclient',''): 
                                value="{{info.get('maxclient','')}}"
                           %else :
                                value="100"
                           %end 
			  >
			  <input type="text" style="width:210px" class="form-control" id="" name="maxuser" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" placeholder="最大并发数" aria-describedby="inputGroupSuccess4Status"
			  %if info.get('maxuser',''): 
                                value="{{info.get('maxuser','')}}"
                          %else :
                                value="3"
                          %end 
			 >
                       </div>
                    </div>
		    <div class="modal-body">
		    	<div class="input-group">
			   <span class="input-group-addon">验证控制&emsp;</span>
			   <input type="text" style="width:140px" class="form-control" id="" name="authtimeout" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" placeholder="验证超时时间(s)" aria-describedby="inputGroupSuccess4Status" 
			   %if info.get('authtimeout',''): 
                                value="{{info.get('authtimeout','')}}"
                           %else :
                                value="120"
                           %end 
			   >
			   <input type="text" style="width:140px" class="form-control" id="" name="authnum" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" placeholder="验证次数锁定" aria-describedby="inputGroupSuccess4Status"
			   %if info.get('authnum',''): 
                                value="{{info.get('authnum','')}}"
                           %else :
                                value="5"
                           %end 
                           >
			   <input type="text" style="width:140px" class="form-control" id="" name="locktime" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" placeholder="验证锁定时长(s)" aria-describedby="inputGroupSuccess4Status"
			   %if info.get('locktime',''): 
                                value="{{info.get('locktime','')}}"
                           %else :
                                value="300"
                           %end 
                           >
		    	</div>
		    </div>
		    <div class="modal-body">
                        <div class="input-group">
			   <span class="input-group-addon">启用压缩&emsp;</span>
			   <select style="width:420px" class="form-control" name="comp">
                                <option 
				%if info.get('comp','')==0 : 
                                    selected    
				%end 
				value="0">启用 
                                </option>
                                <option 
				%if info.get('comp','')==1 : 
                                    selected    
                                %end 
                                        value="1">禁用
                                </option>
                            </select>
			</div>
		   </div>
		   <div class="modal-body">
			 <div class="input-group">
                           <span class="input-group-addon">AnyConnect支持</span>
			   <select style="width:387px" class="form-control" name="cisco">
                                <option 
                                    selected    value="0">启用                 
                                </option>
                                <option 
                                        value="1">禁用
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" style="float:left" class="btn btn-primary">提交</button>
			<a id="rego" style="float:left" class="btn btn-primary" href="/vpnservconf">返回</a>
                    </div>
                </div>
              </form>
            </div>
        </div>
    </div>
</div>
<script src="/assets/js/datetime/bootstrap-datepicker.js"></script> 
<script charset="utf-8" src="/assets/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="/assets/kindeditor/lang/zh_CN.js"></script>
