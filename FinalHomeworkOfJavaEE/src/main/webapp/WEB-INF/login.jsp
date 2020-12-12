<%--
  Created by IntelliJ IDEA.
  User: JustinPot
  Date: 2020/12/12
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>用户登录</title>
    <link href="../css/form.css" rel="stylesheet"/>
    <script type="text/javascript">
        function showMessage(){
            var message = '${message}';
            if (message != "") alert(message);
        }
        var message2 = "${sessionScope['org.springframework.web.servlet.support.SessionFlashMapManager.FLASH_MAPS'][0]['message']}";
        if (message2 != "") alert(message2);
        window.history.replaceState(null, null, window.location.href);
    </script>
</head>

<body onload="showMessage()">

<div class="container" style="width: 400px;height: 300px; border-radius: 15px">
    <div class="form form--login" style="width:400px">
        <div class="form--heading">用户登录</div>
        <form class="form-edit" method="post">
            <P>
            <div style="width: 200px; text-align: center;height: 25px;">
                <input type="text" name="userName" placeholder="请输入用户名">
            </div>
            <div style="width: 200px; text-align: center;height: 25px;">
                <input type="text" name="password" placeholder="请输入密码">
            </div>
            </P>
            <p><input type="submit" class="button" value="登录" style="border-radius: 9px;"></p>
        </form>
    </div>
</div>


</body>
</html>
