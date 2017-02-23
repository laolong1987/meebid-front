<%--
  Created by IntelliJ IDEA.
  User: gaoyang
  Date: 17/2/12
  Time: 下午3:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="include.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <div class="form-top">
                <div class="form-top-left">
                    <h3>Meebid</h3>
                    <p>Enter your username and password to log on:</p>
                </div>
                <div class="form-top-right">
                    <i class="fa fa-key"></i>
                </div>
            </div>
            <form role="form" class="login-form" method="post" action="tologin">
                <div class="form-group">
                    <label class="sr-only" for="username">Username</label>
                    <input type="text" name="username" placeholder="用户名" class="form-control" id="username">
                </div>
                <div class="form-group">
                    <label class="sr-only" for="password">Password</label>
                    <input type="password" name="password" placeholder="密码" class="form-control" id="password">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-info btn-lg btn-block">登录</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
