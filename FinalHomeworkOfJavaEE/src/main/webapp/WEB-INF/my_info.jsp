<%--
  Created by IntelliJ IDEA.
  User: JustinPot
  Date: 2020/11/2
  Time: 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="title">个人信息</rapid:override>

<rapid:override name="css">
    <link href="../css/my_info.css" rel="stylesheet"/>
</rapid:override>

<rapid:override name="content">

    <div class="timeline-small" style="font-size: medium">
        <div class="header">
            <div class="color-overlay">
                <div class="header-name">个人信息</div>
                <div class="header-sub">个人信息展示以及个人信息修改</div>
            </div>
        </div>
        <div class="timeline-small-body" style="font-size: medium">
            <ul>
                <li>
                    <div class="bullet pink"></div>
                    <div class="date" style="font-size: 16px">用户名：</div>
                    <div class="desc">
                        <h3>${userName}</h3>
                        <h4>用户名不可改</h4>
                    </div>
                </li>
                <li>
                    <div class="bullet green"></div>
                    <div class="date" style="font-size: 16px">修改密码:</div>
                    <div class="desc">
                        <h3>密码不可明文展示</h3>
                        <h4><a href="/edit_password/"><ins>修改密码</ins></a></h4>
                    </div>
                </li>
                <li>
                    <div class="bullet blue"></div>
                    <div class="date" style="font-size: 16px">发博数:</div>
                    <div class="desc">
                        <h3>${blogsCount}</h3>
                        <h4><a href="/my_blogs/"><ins>查看自己的博客列表</ins></a></h4>
                    </div>
                </li>
                <li>
                    <div class="bullet green"></div>
                    <div class="date" style="font-size: 16px">评论数:</div>
                    <div class="desc">
                        <h3>${commentsCount}</h3>
                        <h4><a href="/my_comments/"><ins>查看自己的评论列表</ins></a></h4>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</rapid:override>

<%@ include file="base.jsp"%>
