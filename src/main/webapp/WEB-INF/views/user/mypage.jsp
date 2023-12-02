<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.hangsung.user.domain.User" %>

<!DOCTYPE html>
<html>
<head>
    <link href="../.././resources/css/style.css" rel="stylesheet" type="text/css"/>
    <title>My Page</title>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<div class="container my-5">
    <h1 class="display-6 mb-4 fw-bolder"> 🙋 내 정보</h1>
    <hr class="my-3">
    <c:choose>
        <c:when test="${not empty user}">
            <div class="user-info">
                <h5 class="mb-4">이름 : ${user.nickname}</h5>
                <h5 class="mb-4">성별 : ${user.gender}</h5>
            </div>

            <div class="container mb-4" style="padding-left: 0px; width:60%; margin-left:0px">
                <form action="/user/change-nickname" method="post" class="row row-cols-1" style="width:80%">
                    <div class="col-3 mx-0">
                        <label for="newNickname" class="form-label h5">새 비밀번호 : </label>
                    </div>
                    <div class="col-5 mx-0">
                        <input type="password" id="newPassword" name="newPassword" class="form-control">
                    </div>
                    <div class="col-4 mx-0">
                        <button type="submit" class="btn btn-primary">비밀번호 변경</button>
                    </div>
                </form>
            </div>

            <div class="container mb-4" style="padding-left: 0px; width:60%; margin-left:0px">
                <form action="/user/change-nickname" method="post" class="row row-cols-1" style="width:80%">
                    <div class="col-3 mx-0">
                        <label for="newNickname" class="form-label h5">새 닉네임:</label>
                    </div>
                    <div class="col-5 mx-0">
                        <input type="text" id="newNickname" name="newNickname" class="form-control">
                    </div>
                    <div class="col-4 mx-0">
                        <button type="submit" class="btn btn-primary">닉네임 변경</button>
                    </div>
                </form>
            </div>

            <a href="/delete-account" onclick="return confirm('정말로 탈퇴하시겠습니까?');" class="btn btn-danger mb-4">회원 탈퇴</a>
        </c:when>
        <c:otherwise>
            <p class="login-required">로그인이 필요합니다.</p>
        </c:otherwise>
    </c:choose>
    <div style="margin-bottom: 100px"></div>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
