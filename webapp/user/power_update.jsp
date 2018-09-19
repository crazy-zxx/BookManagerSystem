
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="S" uri="/struts-tags" %>
<html>
<head>
    <title>修改用户权限页面</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/content.css" />
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<div class="container" style="float: left">
    <div class="public-nav">您当前的位置：<a href="">管理首页</a>><a href="">修改用户权限</a></div>
    <div class="public-content">
        <div class="public-content-header">
            <h3>用户信息</h3>
        </div>
        <div>
            <form class="form-horizontal" method="post" action="/user/updatePower">
                <div class="form-group">
                    <label for="inputid3" class="col-sm-2 control-label">id</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputid3" name="user.stuid"   value="<s:property value="#request.user.stuid"/>"  placeholder="id不可更改" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputname3" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputname3" name="user.password" value="<s:property value="#request.user.password"/>" placeholder="密码" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputauthor3" class="col-sm-2 control-label">权限</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputauthor3" name="user.power" value="<s:property value="#request.user.power"/>"  placeholder="权限">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-10">
                        <button type="submit" class="btn btn-primary update_btn">修改</button>
                        <a class="btn btn-link back_btn" href="/user/allUser">返回查询页面</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="/js/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){
        $(".update_btn").click(function(){
            alert("更新成功!");
        })
    })
</script>
</body>
</html>
