<%--
  Created by IntelliJ IDEA.
  User: 李洋洋
  Date: 2018/1/6
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
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
        <div class="public-nav">您当前的位置：<a href="">管理首页</a>><a href="">查询借阅图书</a></div>
        <div class="public-content">
            <div class="public-content-header">
                <h3>查询借阅图书</h3>
            </div>
            <div>
                <form class="form-inline" style="margin: 20px 0 20px 0" action="book/bookLike" method="post">
                    <div class="form-group">
                        <label for="exampleInputName2">图书名</label>
                        <input type="text" class="form-control" id="exampleInputName2" name="name" placeholder="所需查询图书名">
                        <button type="submit" class="btn btn-default" >查询</button>
                    </div>
                </form>

                <table class="table table-bordered table-hover" id="course_Table">
                    <thead>
                    <tr>
                        <th><b>id</b>
                        <th><b>书籍名</b>
                        <th><b>作者</b>
                        <th><b>价格</b>
                        <th><b>备注</b>
                        <th><b>借阅状态</b>
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
                            <td id="borrow_status"><s:property value='#book.stuid == ""? "未借":"已借" '/>
                            <td class="success">
                                <button class="btn btn-primary btn-sm borrow_btn" borrow_id=<s:property value="#book.id"/>>
                                    <span class="glyphicon glyphicon-check" >借阅</span>
                                </button>
                            </td>
                        </tr>
                    </S:iterator>
                    </tbody>

                </table>
                <input class="count" value="<s:property value="#session.user_session.count"/>" style="display: none"/>
            </div>
        </div>
    </div>

<script src="/js/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){

        var book_count = $(".count").attr("value");
//        begin:借阅
        $(".borrow_btn").click(function(){
            var book_id = $(this).attr("borrow_id");
            this_btn = $(this);
            var book_status = this_btn.parent().prev("#borrow_status").text();
            if($.trim(book_status) === "已借")
                alert("此书籍已借出!请等待归还后再借或者借阅其它书籍!");
            else if(parseInt(book_count)>=8)
                alert("借阅数量已达到最大值!请归还后再借阅!");
            else
                $.ajax({
                    url:"book/borrow",
                    type:"POST",
                    data:{
                        bookId:book_id
                    },
                    success:function(result){
                        if (result == 1){
                            book_count+=1;
                            this_btn.parent().prev("#borrow_status").text("已借");
                            alert("借阅成功!");
                            window.location.reload();
                        }else
                            alert("借阅失败!");
                    }
                });
        })
        //end


    })
</script>
</body>
</html>
