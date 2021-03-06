<%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 04/01/2016
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <title>用户登录</title>
  </head>
  <body>
  <div style="width:300px;margin-left:auto;margin-right:auto;">
    <h1 align="center">欢迎登录</h1>
    <%
      String errType = request.getParameter("errType");
      if("empty_username".equals(errType))
        out.println("<div class=\"alert alert-danger\" role=\"alert\">用户名不能为空！</div>");
      if("empty_password".equals(errType))
        out.println("<div class=\"alert alert-danger\" role=\"alert\">密码不能为空！</div>");
      if("wrong_username".equals(errType))
        out.println("<div class=\"alert alert-danger\" role=\"alert\">用户名不存在！</div>");
      if("wrong_password".equals(errType))
        out.println("<div class=\"alert alert-danger\" role=\"alert\">密码错误！</div>");
    %>
    <form name="loginForm" method="post" action="checkLogin.jsp" >
      <div class="form-group">
        <label>用户名</label>
        <input type="text" name="username" class="form-control" placeholder="请输入用户名">
      </div>
      <div class="form-group">
        <label >密码</label>
        <input type="password" name="password" class="form-control" placeholder="请输入密码">
      </div>
      <button type="submit" class="btn btn-default">登陆</button>
      <button type="reset" class="btn btn-default">重置</button>
      <a href="register.jsp">新用户注册</a>
    </form>

  </div>
  </body>
</html>
