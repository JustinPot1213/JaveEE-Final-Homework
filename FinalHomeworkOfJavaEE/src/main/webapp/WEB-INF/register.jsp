<%--
  Created by IntelliJ IDEA.
  User: JustinPot
  Date: 2020/12/12
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>新用户注册</title>
    <link href="../css/form.css" rel="stylesheet"/>
    <script type="text/javascript">
        var message = '${message}';
        if (message != "") alert(message);
        window.history.replaceState(null, null, window.location.href);
    </script>
</head>

<body>

<div class="container" style="width: 400px;height: 400px; border-radius: 15px">
    <div class="form form--login" style="width:400px">
        <div class="form--heading">新用户注册</div>
        <form class="form-edit" method="post">
            <P>
            <div style="width: 200px; text-align: center;height: 25px;">
                <input type="text" name="userName" placeholder="请输入用户名">
            </div>
            <div style="width: 200px; text-align: center;height: 25px;">
                <input type="text" name="password1" placeholder="请输入密码">
            </div>
            <div style="width: 200px; text-align: center;height: 25px;">
                <input type="text" name="password2" placeholder="请确认密码">
            </div>
            </P>
            <p><input type="submit" class="button" value="注册" style="border-radius: 9px;"></p>

        </form>
    </div>
</div>

</body>
</html>