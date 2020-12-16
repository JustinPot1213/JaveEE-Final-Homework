<%--
  Created by IntelliJ IDEA.
  User: JustinPot
  Date: 2020/12/14
  Time: 23:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="title">新博客</rapid:override>

<rapid:override name="css">
    <link href="../css/new_blog.css" rel="stylesheet">
</rapid:override>

<rapid:override name="js">
    <script type="text/javascript">
        window.history.replaceState(null, null, window.location.href);
    </script>
</rapid:override>

<rapid:override name="content">
    <br><br>
    <form action="" method="post" class="bootstrap-frm">
        <h1>新博客
            <span>在此尽情书写你的博客吧。</span>
        </h1>
        <label>
            <span>标题 :</span>
            <input id="header" type="text" name="header" placeholder="这里写博客的标题" required/>
        </label>
        <label>
            <span>正文 :</span>
            <textarea id="text" name="text" placeholder="这里写博客的正文" required></textarea>
        </label>

        <label>
            <span>&nbsp;</span>
            <input type="submit" class="button" value="发布" />
        </label>
    </form>
</rapid:override>

<%@ include file="base.jsp"%>