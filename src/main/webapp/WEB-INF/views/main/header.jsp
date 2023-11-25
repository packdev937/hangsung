<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Header</title>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
    <style>
      .header-container {
        display: flex;
        align-items: center;
        justify-content: flex-end; /* 수정된 부분 */
        padding: 10px;
      }

      .header-link {
        text-decoration: none;
        color: black;
        margin-left: 15px;
      }

      .header-icon {
        margin-right: 8px;
      }
    </style>
</head>
<body>
<div class="header-container">
    <div>
        <a href="/mypage" class="header-link">
            <i class="fas fa-user header-icon"></i>마이페이지
        </a>
        <a href="/travel/create" class="header-link">
            <i class="fas fa-plus header-icon"></i>등록하기
        </a>
    </div>
</div>
</body>
</html>
