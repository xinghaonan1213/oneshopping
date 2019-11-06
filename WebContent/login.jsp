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
<title>Insert title here</title>
<style>
		   body>div:first-child{
		   	 width: 1338px;
		   	 /*height: 00px;*/
		   	    /*border: 1px solid black;*/
		   	    position: relative;
		   }
		   article{
		   	
		   	 height: 500px;
		   }
		    article div{
		    	  position: absolute;
		    	  top: 150px;
		    	  right: 150px;
		    	  position: relative;
		    	  
		    }
		    form{
		    	position: relative;
		    }
		    h4{
		    	  float: left;
		    }
		    h5{
		    	  float: right;
		    }
		    a:link{
		    	color: blue;
		    	text-decoration:none;
		    }
		    form p{
		    	  clear: both;
		    }
		    form,h4,h5,p{
		    	  margin: 0px;
		    	  padding: 0px;
		    }
			
			header div{
				position: absolute;
				right: 0px;
				top: 0px;
			}
			.oo{
				position: absolute;
				top: 130px;
				left: 200px;
			}
			.uu{
				float: left;
				font-size: 15px;
			}
            .ii{
            	float: right;
            }
            .ww{
            	background-color: red;
            	text-align: center;
            	width: 300px;
            	height: 40px;
            	color: white;
            }
            .ff{
            	height: 40px;
            	width: 300px;
                 background-image: url(${pageContext.request.contextPath}/static/images/icon1.jpg);
            	background-repeat: no-repeat;
            	text-indent: 3em; 
            	margin: 10px 0; 
            
            	border: 1px solid #999999;	
            }
            .cv{
            	height: 40px;
            	width: 300px;
            	background-image:  url(${pageContext.request.contextPath}/static/images/icon2.jpg);
            	background-repeat: no-repeat;
            	text-indent: 20px;
            	text-indent: 3em;
            	margin-bottom: 10px;
            	border: 1px solid #999999;	
            }
            .sd{
            	margin-bottom: 10px;
            }
            .qw{
            	margin-top: 10px;
            	font-size: 12px;
            }
            .as{
            	margin-top: 10px;
            	position: relative;
            }
            .we{
            	
            	font-size:12px;
            	display: inline-block;
            
            	position: absolute;
            	top: 245px;
            	right: 0px;
            }
            .fg{
            	float: right;
                
            }
            
            .we,img{
            	vertical-align: middle;
            }
            .bn{
            	position: absolute;
            	top: 150px;
            }
            .df{
            	position: absolute;
            	top: 208px;
            	display: none;
            }
            .df a:hover .b3{
            	display: block;
            }
            .onehou{
            	position: absolute;
            	left: 0;
            	display: none;
            }
            .twoqian{position: absolute;
            		left: 40px;
            }
             .twohou{position: absolute;
            		left: 40px;
            		display: none;
            }
            .threeqian{
            	position: absolute;
            	left: 80px;
            }
            .threehou{
            	position: absolute;
            	left: 80px;
            	display: none;
            }
             .fourqian{
            	position: absolute;
            	left: 120px;
            }
             .fourhou{
            	position: absolute;
            	left: 120px;
            	display: none;
            }
            a:hover .onehou{display:inline-block;}
            a:hover .oneqian{display: none;}
             a:hover .twohou{display:inline-block;}
            a:hover .twoqian{display: none;}
             a:hover .threehou{display: inline-block;}
            a:hover .threeqian{display: none;}
             a:hover .fourhou{display: inline-block;}
            a:hover .fourqian{display: none;}
            footer p{
            	text-align: center;
            }
		</style>
	<script type="text/javascript" src="<%=basePath%>/static/js/jquery-1.7.2.js"></script>
</head>
<body>
	<div>
	<header>
			<img src="<%=basePath %>/static/images/loginlogo.jpg"/>
			<div>
				
				<p>您好，欢迎光临1号店！<a href="login.jsp">请登录</a>&nbsp;&nbsp;&nbsp;&nbsp;
			    
				<img src="<%=basePath %>/static/images/runbun.png" />帮助中心<img src="<%=basePath %>/static/images/turnb.png" /></p>
				
			</div>
			<hr />
		</header>
		<article>
			<p class="oo"><img src="<%=basePath %>/static/images/loadimg.jpg"/></p>
			<div class="bn">
			<form action="" method="post">
				<h4>一号店用户登录</h4>
				<h5><a href="${pageContext.request.contextPath }/customer/regist">注册账号</a></h5>
				 <p><input class="ff" type="text" name="hname" placeholder="邮箱/手机/用户名"/></p>
				<p><input class="cv" type="password" name="dname" placeholder="密码"/></p>
		        <p class="uu"><input class="sd" type="checkbox" value=""/>自动登录<a style="padding-left: 145px;">忘记密码？</a></p>
		        <p >
		        <a href="main.jsp">
		        <input class="ww"type="button" value="登录"/></a></p>
		        <p class="qw">更多合作网站账号登录</p>
		        <p class="as">
		        	<a><img class="oneqian" src="<%=basePath %>/static/images/l_1.png"/><img class="onehou" src="<%=basePath %>/static/images/l_1_h.png" /></a>
		        	<a><img class="twoqian" src="<%=basePath %>/static/images/l_2.png"/><img class="twohou" src="<%=basePath %>/static/images/l_2_h.png" /></a>
		            <a><img class="threeqian" src="<%=basePath %>/static/images/l_3.png"/><img class="threehou" src="<%=basePath %>/static/images/l_3_h.png" /></a>        
		            <a><img class="fourqian" src="<%=basePath %>/static/images/l_4.png"/><img class="fourhou" src="<%=basePath %>/static/images/l_4_h.png" /></a>

                 </p>
                 <p class="we"><span>更多合作网站</span><img  src="<%=basePath %>/static/images/turnb.png"/></p>
            </form>
		    </div>
		    </article>
		    <footer>
		    	<p>
		    	沪|CP备13044278 | 合B1.B2-20130004 | 营业执照<br/>
				Copyright&copy; 1号店网上超市 2007-2016 , All Rights Reserved
		    	</p>
		    </footer>
		
		</div>
</body>
</html>