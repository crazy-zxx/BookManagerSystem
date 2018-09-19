<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="S" uri="/struts-tags" %>
<html>
<head>
    <title>用户管理页面</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/content.css" />
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
    <div class="container" style="float: left">
        <div class="public-nav">您当前的位置：<a href="">管理首页</a>><a href="">删除\权限修改用户</a></div>
        <div class="public-content">
            <div class="public-content-header">
                <h3>删除\权限修改用户</h3>
            </div>
            <div>
                <form class="form-inline" style="margin: 20px 0 20px 0" action="user/userLike" method="post">
                    <div class="form-group">
                        <label for="exampleInputName2">用户名</label>
                        <input type="text" class="form-control" id="exampleInputName2" name="stuId" placeholder="所需查询用户名">
                        <button type="submit" class="btn btn-default" >查询</button>
                    </div>
                </form>

                <table class="table table-bordered table-hover" id="course_Table">
                    <thead>
                    <tr>
                        <th><b>账号</b>
                        <th><b>密码</b>
                        <th><b>权限</b>
                        <th><b>已借阅数量</b>
                        <th><b>操作</b>
                    </tr>
                    </thead>
                    <tbody>
                    <S:iterator value="#request.users" var="user" >
                        <tr>
                            <td><s:property value="#user.stuid"/>
                            <td><s:property value="#user.password"/>
                            <td><s:property value="#user.power == 0 ? '普通用户':'管理员'"/>
                            <td><s:property value="#user.count"/>
                            <td class="success">
                                <button class="btn btn-primary btn-sm update_btn" borrow_id=<s:property value="#user.stuid"/>>
                                    <span class="glyphicon glyphicon-pencil">修改权限</span>
                                </button>
                                <button class="btn btn-danger btn-sm delete_btn" borrow_id=<s:property value="#user.stuid"/>>
                                    <span class="glyphicon glyphicon-remove">删除用户</span>
                                </button>
                            </td>
                        </tr>
                    </S:iterator>
                    </tbody>

                </table>
            </div>
        </div>
    </div>

<script src="/js/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){
//        begin:修改
        $(".update_btn").click(function(){
            var user_id = $(this).attr("borrow_id");
            window.location.href='user/oneUser?stuId='+user_id;
        })
        //end

//        begin:删除
        $(".delete_btn").click(function(){
            var user_id = $(this).attr("borrow_id");
            this_btn = $(this);
            if (confirm("确定要删除账号为"+user_id+"用户吗?"))
                $.ajax({
                    url:"user/deleteUser",
                    type:"POST",
                    data:{
                        stuId:user_id
                    },
                    success:function(result){
                        if (result === "1"){
                            this_btn.parent().parent().remove();
                            alert("删除成功!");
                        }else
                            alert("删除失败!");
                    }
                });
        })
        //end


    })
</script>
</body>
</html>
