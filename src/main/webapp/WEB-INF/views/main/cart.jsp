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
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <style>
        table th {
            font-size: 20px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('#remove-package-button').click(function () {
                var packageId = $(this).data('package-id');
                $.ajax({
                    url: '/travel/removeCart',
                    type: 'POST',
                    data: {travelPackageId: packageId},
                    success: function () {
                        alert('삭제 완료');
                        window.location.reload();
                    },
                    error: function () {
                        alert('오류가 발생했습니다. 다시 시도해주세요.');
                    }
                });
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#order-packages-button').click(function () {
                $.ajax({
                    url: '/travel/orderCart',
                    type: 'POST',
                    success: function () {
                        alert('구매가 완료되었습니다.');
                        window.location.reload();
                    },
                    error: function () {
                        alert('오류가 발생했습니다. 다시 시도해주세요.');
                    }
                });
            });
        });
    </script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
    <h1 class="display-6 fw-bolder my-5" > 🛒 장바구니</h1>
    <c:choose>
    <c:when test="${not empty cart}">
        <table class="table table-striped table-hover" style="background-color: #f3f3f3">
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
                        <button id="remove-package-button" class="btn btn-success"
                                data-package-id="${pkg.id}"> 삭제하기
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div style=" margin-top: 50px; margin-bottom: 100px; display: flex; justify-content:
                        space-between; align-items: center
                ">
            <h2 style="margin-right: auto;">총 가격: ${totalPrice}</h2>
            <button id="order-packages-button" class="btn btn-success"> 결제하기</button>
        </div>
    </c:when>
    <c:otherwise>
    <hr class="my-3">
    <div class="container d-flex align-items-center flex-column">
        <img src="../.././resources/images/newEmptyCart.png"
             style="height: 300px; width: 300px; margin-bottom: 80px"/>
        <h4 class="fw-bold text-start mb-4 ps-0">장바구니가 텅 비었어요 🥲</h4>
        <button href="../home.jsp" type="button" class="btn btn-outline-secondary mb-4">패키지 구경하러 가기
            🛒
        </button>

    </div>
</div>
</c:otherwise>
</c:choose>

</div>
<jsp:include page="footer.jsp"/>
</body>

</html>