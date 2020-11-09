<%--
  Created by IntelliJ IDEA.
  User: JustinPot
  Date: 2020/11/2
  Time: 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>


<rapid:override name="title">大学公共课程共享资源管理平台</rapid:override>

<rapid:override name="css">
    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <link href="css/pagination.css" rel="stylesheet"/>
</rapid:override>

<rapid:override name="content">
<div class="container">
    <div class="header" id="head"  >
        <div class="title" style="text-align: center;"><h1>个人信息</h1></div>
    </div>
    <div class="col" style="text-align: center">
        {% csrf_token %}
        <div class="row">
            <div class="text-center">用户名:{{User.UserID}}</div>

        </div>
        <div class="row">
            <div class="text-center">用户昵称:{{User.UserName}}</div>

        </div>
        <div class="row">
            <div class="text-center">邮箱:{{User.Email}}</div>

        </div>
        <div class="row">
            <a href="/editusername/"><ins>修改昵称</ins></a>
        </div>
        <div class="row">
            <a href="/editpassword/"><ins>修改密码</ins></a>
        </div>
        <div class="row">
            <a href="/index/"><ins>后退</ins></a>
        </div>
    </div>
</div>
</rapid:override>
