<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Top Liked Packages</title>
</head>
<body>
<h1>Top Liked Travel Packages</h1>
<c:forEach var="package" items="${topPackages}">
    <div>
        <h2>${package.title}</h2>
        <!-- 패키지 내용을 더 표시할 수 있습니다. -->
    </div>
</c:forEach>
</body>
</html>