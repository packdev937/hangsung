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
<div class="container">
    <h1 class="display-6 fw-bolder" style="margin-top: 30px; margin-bottom: 30px"> 🛒 장바구니</h1>
    <c:choose>
    <c:when test="${not empty cart}">
        <table class="table" style="background-color: #f3f3f3">
            <thead>
            <tr>
                <th>패키지명</th>
                <th>가격</th>
                <th>삭제</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="pkg" items="${cart}">
                <tr>
                    <td>${pkg.title}</td>
                    <td>${pkg.price}</td>
                    <td>
                        <form action="/travel/removeCart" method="post">
                            <input type="hidden" name="packageId" value="${pkg.id}"/>
                            <input type="submit" class="btn btn-danger" value="삭제"/>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div style="margin-top: 50px; margin-bottom: 100px; display: flex; justify-content: space-between; align-items: center">
            <h2 style="margin-right: auto;">총 가격: ${totalPrice}</h2>
            <!-- 결제 페이지로 이동하는 버튼 또는 링크 -->
            <form action="/travel/checkout" method="post" style="margin-left: auto; margin-right: 200px">
                <button type="submit" class="btn btn-primary">결제하기</button>
            </form>
        </div>
    </c:when>
    <c:otherwise>
    <div class="container d-flex align-items-center flex-column">
        <img src="../.././resources/images/emptyCart.png" style="height: 300px; width: 300px; margin-bottom: 100px"/>
        <h4 class="fw-bold text-start mb-3 ps-0">장바구니가 텅 비었어요 </h4>
        <button href="../home.jsp" type="button" class="btn btn-outline-secondary mb-3">패키지 구경하러 가기 🛒</button>
        <h6 class="text-start mb-3 ps-0 text-secondary">아래의 패키지도 구경해보세요 ⬇️</h6>
    </div>
</div>
<jsp:include page="../main/recommendPackages.jsp"/>
</c:otherwise>
</c:choose>

</div>
<jsp:include page="footer.jsp"/>
</body>

</html>
