<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link type="text/css" rel="stylesheet" media="all" href="../css/reset.css" />
	<link type="text/css" rel="stylesheet" media="all" href="../css/login.css" />
	<title>图书管理系统主页面</title>
</head>
<body>

<div class="page">
	<div class="loginwarrp">
		<div class="logo">登陆</div>
		<div class="login_form">
			<form id="Login" name="Login" method="post" onsubmit="" action="/user/login">
				<li class="login-item">
					<span>用户名：</span>
					<input type="text" name="user.stuid" class="login_input" placeholder="请输入账号">
				</li>
				<li class="login-item">
					<span>密　码：</span>
					<input type="password" name="user.password" class="login_input" placeholder="请输入密码">
				</li>

				<div class="clearfix"></div>
				<li class="login-sub">
					<input type="submit" name="Submit" value="登录" />
				</li>
				<li >
					<span style="float: left">还未注册？</span>
					<a href="/user/register.jsp" style="color: cyan;float: left">去注册</a>
				</li>
			</form>
		</div>
	</div>
</div>

</body>
</html>