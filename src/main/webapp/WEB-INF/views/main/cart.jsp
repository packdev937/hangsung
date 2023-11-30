<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>장바구니</title>
    <link rel="icon" type="image/x-icon" href="../assets/favicon.ico"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
          rel="stylesheet"/>
    <link href="../.././resources/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<h1>장바구니</h1>
<c:choose>
    <c:when test="${not empty cart}">
        <table>
            <tr>
                <th>패키지명</th>
                <th>가격</th>
                <th>삭제</th>
            </tr>
            <c:forEach var="pkg" items="${cart}">
                <tr>
                    <td>${pkg.title}</td>
                    <td>${pkg.price}</td>
                    <td>
                        <form action="/travel/removeCart" method="post">
                            <input type="hidden" name="packageId" value="${pkg.id}"/>
                            <input type="submit" value="삭제"/>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <p>장바구니가 비어있습니다.</p>
    </c:otherwise>
</c:choose>

<div>
    <h2>총 가격: ${totalPrice}</h2>
    <!-- 결제 페이지로 이동하는 버튼 또는 링크 -->
    <a href="checkout">결제하기</a>
</div>

</body>
</html>
