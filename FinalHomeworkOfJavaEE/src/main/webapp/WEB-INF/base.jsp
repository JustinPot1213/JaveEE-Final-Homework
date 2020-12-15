<%--
  Created by IntelliJ IDEA.
  User: JustinPot
  Date: 2020/11/9
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
        <rapid:block name="title"></rapid:block>
    </title>
    <rapid:block name="descriptions"></rapid:block>
    <link href="../css/navigation.css" rel="stylesheet">
    <rapid:block name="css"></rapid:block>

    <rapid:block name="js"></rapid:block>

</head>

<body>

<div class='card-holder'>
    <div class='card-wrapper'>
        <a href='/index/'>
            <div class='card bg-01'>
                <span class='card-content'>博客主页</span>
            </div>
        </a>
    </div>

    <div class='card-wrapper'>
        <a href='/my_information/'>
            <div class='card bg-02'>
                <span class='card-content'>个人信息</span>
            </div>
        </a>
    </div>

    <div class='card-wrapper'>
        <a href='/my_comments/'>
            <div class='card bg-03'>
                <span class='card-content'>我的评价</span>
            </div>
        </a>
    </div>

    <div class='card-wrapper'>
        <a href='/record/'>
            <div class='card bg-04'>
                <span class='card-content'>历史浏览</span>
            </div>
        </a>
    </div>

    <div class='card-wrapper'>
        <a href='/messages/'>
            <div class='card bg-05'>
                <span class='card-content'>我的消息</span>
            </div>
        </a>
    </div>

    <div class='card-wrapper'>
        <a href='/my_blogs/'>
            <div class='card bg-06'>
                <span class='card-content'>我的博客</span>
            </div>
        </a>
    </div>

    <div class='card-wrapper'>
        <a href='/about_us/'>
            <div class='card bg-07'>
                <span class='card-content'>关于作者</span>
            </div>
        </a>
    </div>
</div>

<rapid:block name="content"></rapid:block>

</body>
</html>
