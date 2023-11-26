<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.hangsung.user.domain.User" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Page</title>
</head>
<body>
<div class="container mypage">
    <h2>내 정보</h2>
    <c:choose>
        <c:when test="${not empty user}">
            <p>이름: ${user.nickname}</p>
            <p>성별: ${user.gender}</p>

            <form action="/user/change-password" method="post">
                <label for="newPassword">새 비밀번호:</label>
                <input type="password" id="newPassword" name="newPassword">
                <button type="submit">비밀번호 변경</button>
            </form>

            <form action="/user/change-nickname" method="post">
                <label for="newNickname">새 닉네임:</label>
                <input type="text" id="newNickname" name="newNickname">
                <button type="submit">닉네임 변경</button>
            </form>

            <a href="/delete-account" onclick="return confirm('정말로 탈퇴하시겠습니까?');">회원 탈퇴</a>
        </c:when>
        <c:otherwise>
            <p>로그인이 필요합니다.</p>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
