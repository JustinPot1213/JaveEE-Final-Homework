<%--
  Created by IntelliJ IDEA.
  User: JustinPot
  Date: 2020/12/12
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="title">博客主页</rapid:override>

<rapid:override name="css">
    <link href="../css/table.css" rel="stylesheet"/>
</rapid:override>

<rapid:override name="js">
    var message2 = "${sessionScope['org.springframework.web.servlet.support.SessionFlashMapManager.FLASH_MAPS'][0]['message']}";
    if (message2 != "") alert(message2);
    window.history.replaceState(null, null, window.location.href);
</rapid:override>

<rapid:override name="content">
</rapid:override>

<%@ include file="base.jsp"%>