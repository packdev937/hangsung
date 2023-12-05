<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../.././resources/css/style.css" rel="stylesheet" type="text/css"/>
    <script type ="text/javascript" src ="../../../resources/js/validation.js"></script>
    <title>회원 가입</title>
</head>
<body>
<header class="bg-dark-with-image py-3">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-black">
            <h1 class="display-5 fw-bolder">회원 가입</h1>
        </div>
    </div>
</header>
<c:if test="${not empty signupError}">
    <div style="color: red;">${signupError}</div>
</c:if>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <form action="/signup" method="post" onsubmit="return checkSignUpForm()">
                <div class="form-group mb-3">
                    <label for="username" style="font-size:18px"> 사용자 아이디</label>
                    <input type="text" class="form-control form-control-lg" id="username"
                           name="username" required>
                </div>
                <div class="form-group mb-3">
                    <label for="password" style="font-size:18px"> 비밀 번호</label>
                    <input type="password" class="form-control form-control-lg"
                           placeholder="영문자와 숫자 혼합 입력" id="password" name="password" required>
                </div>
                <div class="form-group mb-3">
                    <label for="nickname" style="font-size:18px">닉네임</label>
                    <input type="text" class="form-control form-control-lg" id="nickname"
                           name="nickname" required>
                </div>
                <div class="form-group mb-3">
                    <label for="birthAt" style="font-size:18px">생년 월일</label>
                    <input type="date" class="form-control form-control-lg" id="birthAt"
                           name="birthAt" required>
                </div>
                <div class="form-group mb-3">
                    <label style="font-size:20px">성별</label>
                    <input type="radio" id="male" name="gender" value="MALE" required> <label
                        for="male" style="font-size:18px">남성</label>
                    <input type="radio" id="female" name="gender" value="FEMALE"> <label
                        for="female" style="font-size:18px">여성</label>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary btn-lg">가입하기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div style="margin-top: 100px;">
    <jsp:include page="../main/footer.jsp"/>
</div>
</body>
</html>

