
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="S" uri="/struts-tags" %>
<html>
<head>
    <title>查询图书页面</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/content.css" />
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<div class="container" style="float: left">
    <div class="public-nav">您当前的位置：<a href="">管理首页</a>><a href="">归还书籍</a></div>
    <div class="public-content">
        <div class="public-content-header">
            <h3>归还所借书籍</h3>
        </div>
        <div>
            <table class="table table-bordered table-hover" id="course_Table">
                <thead>
                <tr>
                    <th><b>id</b>
                    <th><b>书籍名</b>
                    <th><b>作者</b>
                    <th><b>价格</b>
                    <th><b>备注</b>
                    <th><b>操作</b>
                </tr>
                </thead>
                <tbody>
                <S:iterator value="#request.books" var="book" >
                    <tr>
                        <td><s:property value="#book.id"/>
                        <td><s:property value="#book.name"/>
                        <td><s:property value="#book.author"/>
                        <td><s:property value="#book.price"/>
                        <td><s:property value="#book.comment"/>
                        <td class="success">
                            <button class="btn btn-primary btn-sm borrow_btn" borrow_id=<s:property value="#book.id"/> >
                                <span class="glyphicon glyphicon-check">归还</span>
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
//        begin:归还
        $(".borrow_btn").click(function(){
            var book_id = $(this).attr("borrow_id");
            this_btn = $(this);
            var book_status = this_btn.parent().prev("#borrow_status").text();
            $.ajax({
                url:"book/revert",
                type:"POST",
                data:{
                    bookId:book_id
                },
                success:function(result){
                    if (result == 1){
                        this_btn.parent().parent().remove();
                        alert("归还成功!");
                    }else
                        alert("归还失败!");
                }
            });
        })
        //end


    })
</script>
</body>
</html>
