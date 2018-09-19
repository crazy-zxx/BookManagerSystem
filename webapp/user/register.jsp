<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" media="all" href="../css/login.css" />
    <link type="text/css" rel="stylesheet" media="all" href="../css/reset.css" />
    <title>注册页面</title>
</head>
<body>
<div class="page">
    <div class="loginwarrp">
        <div class="logo">注册账号</div>
        <div class="login_form">
            <form id="Login" name="Login" method="post"  action="/user/register">
                <li class="login-item">
                    <span>用  户  名：</span>
                    <input type="text" name="user.stuid" class="login_input username" placeholder="学生号或者教职工号">
                </li>
                <li class="login-item">
                    <span>密   　码 ：</span>
                    <input type="password" name="password" class="login_input pass1" placeholder="数字、下划线或字母">
                </li>
                <li class="login-item">
                    <span>确认密码：</span>
                    <input type="password" name="user.password" class="login_input pass2" placeholder="再次输入密码">
                </li>
                <li class="login-item">
                    <span style="color: red">此处注册的用户均为普通用户,管理员才可修改与赋予权限.</span>
                </li>

                <li class="login-sub">
                    <input type="submit" value="注册"  class="btn_sub"/>
                </li>
            </form>
        </div>
    </div>
</div>
<script src="../js/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){
        $(".btn_sub").click(function(){
            var pass1 = $(".pass1").val();
            var pass2 = $(".pass2").val();
            if (pass1 === pass2) {
                alert("注册成功!转到登录界面");
                return true;
            } else {
                alert("两次输入密码不一致,请重新输入!");
                $(".pass1").val("");
                $(".pass2").val("");
                return false;
            }
        })
    })
</script>
</body>
</html>
