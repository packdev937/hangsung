<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <style>
      body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f4;
        text-align: center;
        padding: 50px;
      }
      h1 {
        color: #333;
      }
      .form-group {
        margin-bottom: 15px;
      }
      input[type="text"], input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
      }
      button {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
      }
      button:hover {
        background-color: #0056b3;
      }
      .signup-link {
        margin-top: 20px;
        font-size: small;
      }
      .signup-link a {
        color: #007bff;
        text-decoration: none;
      }
      .signup-link a:hover {
        text-decoration: underline;
      }
    </style>
</head>
<body>
<h1>Login</h1>
<c:if test="${not empty sessionScope.loginError}">
    <div style="color: red;">${sessionScope.loginError}</div>
</c:if>
<form action="/login" method="post">
    <div class="form-group">
        <input type="text" name="username" placeholder="Username" required>
    </div>
    <div class="form-group">
        <input type="password" name="password" placeholder="Password" required>
    </div>
    <button type="submit">Login</button>
</form>
<div class="signup-link">
    아직 회원이 아니신가요? <a href="/signup">회원 가입</a>
</div>
</body>
</html>
