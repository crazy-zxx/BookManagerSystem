
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="S" uri="/struts-tags" %>
<html>
<head>
    <title>修改书籍信息页面</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/content.css" />
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<div class="container" style="float: left">
    <div class="public-nav">您当前的位置：<a href="">管理首页</a>><a href="">修改书籍信息</a></div>
    <div class="public-content">
        <div class="public-content-header">
            <h3>书籍信息</h3>
        </div>
        <div>
            <form class="form-horizontal" method="post" action="book/updateBook">
                <div class="form-group">
                    <label for="inputid3" class="col-sm-2 control-label">id</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputid3" name="book.id"   value="<s:property value="#request.book.id"/>"  placeholder="id不可更改" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputname3" class="col-sm-2 control-label">书籍名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputname3" name="book.name" value="<s:property value="#request.book.name"/>" placeholder="书籍名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputauthor3" class="col-sm-2 control-label">作者</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputauthor3" name="book.author" value="<s:property value="#request.book.author"/>"  placeholder="作者">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputprice3" class="col-sm-2 control-label">价格</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputprice3" name="book.price" value="<s:property value="#request.book.price"/>" placeholder="价格">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputcomment3" class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputcomment3" name="book.comment" value="<s:property value="#request.book.comment"/>" placeholder="备注">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-10">
                        <button type="submit" class="btn btn-primary add_btn">修改</button>
                        <a class="btn btn-link back_btn" href="/book/allBook">返回查询页面</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="/js/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){
        $(".add_btn").click(function(){
            alert("修改成功!");
        })
    })
</script>
</body>
</html>
