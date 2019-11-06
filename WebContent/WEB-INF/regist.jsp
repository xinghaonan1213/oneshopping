<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//获取项目名
	String path = request.getContextPath();
	//获取tomcat 协议+地址+端口号+ 获取项目名
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册页面</title>
<link href="<%=basePath %>/static/css/regist.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=basePath%>/static/js/jquery-1.7.2.js"></script>	
</head>
<body>
		<header>
			<img src="<%=basePath %>/static/images/loginlogo.jpg" height="55px" width="145px"/>
			<div class="you">
				<div class="q1">
				<span class="hui">您好，欢迎光临1号店！<a class="denglu" href="login.jsp">请登录</a></span>&nbsp;	&nbsp;	&nbsp;	
				<a class="d1" href="#"><img src="<%=basePath %>/static/images/runbun.png"><span class="bang">帮助中心</span><img src="<%=basePath %>/static/images/turnb.png"/></a>
				</div>
			</div>
			<hr/>
		</header>
		<div class="zhong">
			<h2>1号店注册</h2>
			<form method="post" action="#">
			<span id="msg" style="color: red; font-size: 12px; margin-left: 20px;"></span>
			    <p  class="r1"><input id="cname" name="cname" type="text" placeholder="用户名" size="34px" class="gao"/>
			    <span id="cnameInfo"></span></p>
				<p class="r1"> 
				<input id="phone" name="phone" type="text" placeholder="手机号" size="34px" class="gao"/>
						<span id="phoneInfo"></span>
				</p>
				<p> <input  type="password" id="code" placeholder="验证码" class="gao2"/>
					<input	id="zphone" type="button"  value="获取验证码" class="bian" /></p>
				<P> <input type="password" id="pwd" name="password" placeholder="设置密码" size="34px"class="gao"/><span id="pwdInfo"></span></P>
				<P> <input type="password" id="repwd" name="repassword" placeholder="确认密码" size="34px"class="gao"/><span id="repwdInfo"></span></P>
					
				<p class="di">点击注册，表示同意1号店<a href="#">《服务协议》</a></p>
				<p><a href="login.html"><input type="button" value="同意协议并注册" class="b2" /></a> </p>
				<p class="zi">沪|CP备13044278 | 合B1.B2-20130004 | 营业执照<br/>
				Copyright&copy; 1号店网上超市 2007-2016 , All Rights Reserved	
				</p>
			</form>
		</div>
</body>
<script type="text/javascript">
	
	//验证码读秒
	var iTime = 59;
    var Account;
function remainTime(){
	document.getElementById('zphone').disabled = true;
	var iSecond,sSecond="",sTime="";
	if (iTime >= 0){
		iSecond = parseInt(iTime%60);
		iMinute = parseInt(iTime/60)
		if (iSecond >= 0){
			if(iMinute>0){
				sSecond = iMinute + "分" + iSecond + "秒";
			}else{
				sSecond = iSecond + "秒";
			}
		}
		sTime=sSecond;
		if(iTime==0){
			clearTimeout(Account);
			sTime='获取手机验证码';
			iTime = 59;
			document.getElementById('zphone').disabled = false;
		}else{
			Account = setTimeout("remainTime()",1000);
			iTime=iTime-1;
		}
	}else{
		sTime='没有倒计时';
	}
	document.getElementById('zphone').value = sTime;
}
//设置姓名，密码的非空校验和确认密码的一致，非空校验校验
$("#cname").blur(function(){
    //先获取值
    var cname=$(this).val();
	//如果为空，则提示姓名不能为空的错误信息提示
	if(cname == null || cname==""){
		$("#cnameInfo").text("用户名不能为空！！").css("color","red");
	}else{
		$("#cnameInfo").text("用户名可以使用！！").css("color","green");
	}
})
//密码
$("#pwd").blur(function(){
	//先获取地址的值
	var pwd=$(this).val();
	if(pwd==null || pwd==""){
		$("#pwdInfo").text("密码不能为空").css("color","red");
	}else{
		$("#pwdInfo").text("密码可以使用！！！").css("color","green");
	}
})
//确认密码
$("#repwd").blur(function(){
	//先获取地址的值
	var repwd=$(this).val();
	var pwd=$("#pwd").val();
	if((repwd==null || repwd=="")||(pwd!=repwd)){
		$("#repwdInfo").text("确认密码不能为空或者俩次密码不一致").css("color","red");
	}else{
		$("#repwdInfo").text("确认密码可以使用！！").css("color","green");
	}
})
//判断手机号
$("#zphone").click(function(){
	//先获取phone的值
	var phone=$("#phone").val();
	//进行手机号的非空正则，以及已注册校验
	if(phone==null || phone == ""){
		$("#msg").text("电话号码不能为空").css("color","red");
		//聚焦 并跳出
		$("#phone").focus();
		return;
	}
	if(!(/^1[3456789]\d{9}$/.test(phone))){
		$("#msg").text("电话号码不符合规范").css("color","red");
		$(this).focus();
	}else{
		//判断唯一性，需要与后台进行交互，判断电话号码是否已经存在，存在咋不能继续注册
		$.ajax({
			url:"${pageContext.request.contextPath }/customer/checkPhoneIsRegist",
			type:"post",
			data:{"phone":phone},
			dataType:"json",
			success:function(isRegiste){
			   if(isRegiste){
				   remainTime();//读秒
				   createCode(phone);//发送验证码
				}else{
			$("#msg").text("该电话号码未被注册，请先注册!").css("color","red");
				}
			}
		})
	}
})
//发送验证码的方法：
function createCode(phone){
	$.ajax({
		url:"${pageContext.request.contextPath }/customer/createCode",
		type:"post",
		data:{"phone":phone},
		dataType:"json",
		success:function(isSuccess){
			if(isSuccess){
				$("#msg").text("验证码发送成功").css("color","green");
			}else{
				$("#msg").text("验证码发送失败").css("color","red");
			}
		}
	})
}
//设置注册按钮的点击事件，并确保验证码正确
$("#btn").click(function(){
	//需要验证手机号和验证码是否正确 与后台的验证码进行比对
	//获取对应的值
	var phone=$("#phone").val();
	var code=$("#code").val();
	$.ajax({
		url:"user",
		type:"post",
		data:{"phone":phone,"code":code,"func":"validateCode"},
		dataType:"json",
		success:function(isSuccess){
			if(isSuccess){
				//跳转到主界面 index.jsp
				//window.location="index.jsp";
				window.location="index?func=indexInfo";
			}else{
				$("#msg").text("验证码输入错误，请重新输入！").css("color","red");
				$("#code").focus();
			}
		}
	})
	
})
</script>
</html>