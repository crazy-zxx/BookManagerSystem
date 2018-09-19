<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>修改密码页面</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/content.css" />
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<div class="container" style="float: left">
    <div class="public-nav">您当前的位置：<a href="">用户管理</a>><a href="">修改密码</a></div>
    <div class="public-content">
        <div class="public-content-header">
            <h3>修改个人密码</h3>
        </div>
        <div>
            <form>
                <div class="form-group">
                    <label for="exampleInputEmail1">用户名</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" value="<s:property value="#session.user_session.stuid"/>" disabled>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">新密码</label>
                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="密码">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword2">确认密码</label>
                    <input type="password" class="form-control" id="exampleInputPassword2" placeholder="请保持两次密码相同">
                </div>
                <button type="button" class="btn btn-default update_user">修改</button>
            </form>

        </div>
    </div>
</div>

<script src="/js/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){
//        begin:借阅
        $(".update_user").click(function(){
            var pass = $("#exampleInputPassword2").val();
                $.ajax({
                    url:"user/updateUser",
                    type:"POST",
                    data:{
                        pass:pass
                    },
                    success:function(result){
                        if (result == 1){
                            $("#exampleInputPassword1").val("");
                            $("#exampleInputPassword2").val("");
                            alert("密码修改成功!新密码:"+pass);
                            top.location= "/user/login.jsp";
                        }else
                            alert("密码修改失败!");
                    }
                });
        })
        //end


    })
</script>
</body>
</html>
