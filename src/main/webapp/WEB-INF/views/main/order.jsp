<%@ page import="com.hangsung.travel.domain.TravelPackage" %>
<%@ page import="java.util.List" %>
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
    <h1 class="display-6 fw-bolder" style="margin-top: 30px; margin-bottom: 30px"> 🛒 구매 내역</h1>
    <c:choose>
        <c:when test="${not empty order}">
            <table class="table" style="background-color: #f3f3f3">
                <thead>
                <tr>
                    <th>패키지명</th>
                    <th>가격</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="pkg" items="${order}">
                    <tr>
                        <td>${pkg.title}</td>
                        <td>${pkg.price}</td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <%
                double totalPrice = 0;
                List<TravelPackage> orderItems = (List<TravelPackage>) request.getAttribute(
                        "order");
                for (TravelPackage pkg : orderItems) {
                    totalPrice += pkg.getPrice();
                }
                request.setAttribute("totalPrice", (int) totalPrice);
            %>
        </c:when>
    </c:choose>
    <div style="margin-top: 50px; margin-bottom: 100px; display: flex; justify-content: space-between; align-items: center">
        <h2 style="margin-right: auto;">총 가격: ${totalPrice}</h2>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>

</html>
