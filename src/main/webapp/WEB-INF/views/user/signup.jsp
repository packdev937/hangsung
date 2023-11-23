<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
      }

      form {
        width: 300px;
      }

      .form-group {
        margin-bottom: 10px;
      }

      label {
        display: block;
        margin-bottom: 5px;
      }

      input[type="text"], input[type="password"], input[type="date"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
      }

      button {
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 4px;
        background-color: #5cb85c;
        color: white;
        cursor: pointer;
      }

      button:hover {
        background-color: #4cae4c;
      }
    </style>
</head>
<body>
<c:if test="${not empty signupError}">
    <div style="color: red;">${signupError}</div>
</c:if>
<form action="/signup" method="post">
    <div class="form-group">
        <label for="username"> 사용자 아이디:</label>
        <input type="text" id="username" name="username" required>
    </div>
    <div class="form-group">
        <label for="password">비밀 번호:</label>
        <input type="password" id="password" name="password" required>
    </div>
    <div class="form-group">
        <label for="nickname">닉네임:</label>
        <input type="text" id="nickname" name="nickname" required>
    </div>
    <div class="form-group">
        <label for="birthAt">생년 월일:</label>
        <input type="date" id="birthAt" name="birthAt" required>
    </div>
    <div class="form-group">
        <label>성별:</label>
        <input type="radio" id="male" name="gender" value="MALE" required>
        <label for="male">남성</label>
        <input type="radio" id="female" name="gender" value="FEMALE">
        <label for="female">여성</label>
    </div>
    <button type="submit">가입하기</button>
</form>
</body>
</html>
