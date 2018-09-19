<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/public.css">
    <title>管理图书系统页面</title>
</head>
<body>
<div class="public-header-warrp">
    <div class="public-header">
        <div class="content">
            <div class="public-header-logo"><a href=""><h3>图书管理系统</h3></a></div>
            <div class="public-header-admin fr">
                <p class="admin-name"><s:property value="#session.user_session.stuid"/>  管理员 您好！</p>
                <div class="public-header-fun fr">
                    <span >
                        现在时间：<span id="time"></span>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clearfix"></div>
<!-- 内容展示 -->
<div class="public-ifame mt20">
    <div class="content">
        <div class="clearfix"></div>
        <!-- 左侧导航栏 -->
        <div class="public-ifame-leftnav">
            <div class="public-title-warrp">
                <div class="public-ifame-title ">
                    <a href="/book/main.jsp">首页</a>
                </div>
            </div>
            <ul class="left-nav-list">
                <li class="public-ifame-item">
                    <a href="javascript:;">图书管理</a>
                    <div class="ifame-item-sub">
                        <ul>
                            <li class="active"><a href="/book/allBook" target="content">管理图书(修改\删除)</a></li>
                            <li><a href="/book/manage_add.jsp" target="content">添加图书</a></li>
                        </ul>
                    </div>
                </li>
                <li class="public-ifame-item">
                    <a href="javascript:;">用户管理</a>
                    <div class="ifame-item-sub">
                        <ul>
                            <li><a href="/user/update.jsp" target="content">修改个人密码</a></li>
                            <li><a href="/user/allUser" target="content">管理用户(权限\删除)</a></li>
                            <li><a href="/user/login.jsp" target="_self">退出当前用户</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <!-- 右侧内容展示部分 -->
        <div class="public-ifame-content">
            <iframe name="content" src="/book/manageuser.jsp" frameborder="0" id="mainframe" scrolling="yes" marginheight="0" marginwidth="0" width="100%" style="height: 700px;margin-top: 50px"></iframe>
        </div>
    </div>
</div>
<script src="../js/jquery.min.js"></script>
<script>

    //动态显示当前系统时间
    var formatDate = function (date) {
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        m = m < 10 ? ('0' + m) : m;
        var d = date.getDate();
        d = d < 10 ? ('0' + d) : d;
        var h = date.getHours();
        var minute = date.getMinutes();
        minute = minute < 10 ? ('0' + minute) : minute;
        return y + '-' + m + '-' + d+' '+h+':'+minute;
    };
    function gettime(){
        var date=formatDate(new Date());
        document.getElementById("time").innerHTML=date;
        window.setTimeout("gettime()",60000);
    }
    window.onload=gettime;
    //end


    $().ready(function(){
        var item = $(".public-ifame-item");

        for(var i=0; i < item.length; i++){
            $(item[i]).on('click',function(){
                $(".ifame-item-sub").hide();
                if($(this.lastElementChild).css('display') == 'block'){
                    $(this.lastElementChild).hide()
                    $(".ifame-item-sub li").removeClass("active");
                }else{
                    $(this.lastElementChild).show();
                    $(".ifame-item-sub li").on('click',function(){
                        $(".ifame-item-sub li").removeClass("active");
                        $(this).addClass("active");
                    });
                }
            });
        }
    });
</script>
</body>
</html>