<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="../.././resources/css/style.css" rel="stylesheet" type="text/css"/>
    <title>Login</title>
</head>
<body>
<header class="bg-dark-with-image py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-black">
            <h1 class="display-4 fw-bolder">로그인</h1>
        </div>
    </div>
</header>
<c:if test="${not empty sessionScope.loginError}">
    <div style="color: red;">${sessionScope.loginError}</div>
</c:if>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <c:if test="${not empty requestScope.loginError}">
                <div style="color: red;">${requestScope.loginError}</div>
            </c:if>
            <form action="/login" method="post">
                <div class="form-group mb-3">
                    <input type="text" class="form-control form-control-lg"
                           name="username" placeholder="Username" required>
                </div>
                <div class="form-group mb-3">
                    <input type="password" class="form-control form-control-lg"
                           name="password" placeholder="Password" required>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary btn-lg">Login</button>
                </div>
                <div class="signup-link mt-3">
                    아직 회원이 아니신가요? <a href="/signup">회원 가입</a>
                </div>
            </form>
        </div>
    </div>
</div>
<div style="margin-top: 150px;">
    <jsp:include page="../main/footer.jsp"/>
</div>
</body>
</html>
