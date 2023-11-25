<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Travel Package Details</title>
</head>
<body>
<h1>Travel Package Details</h1>
<div>
    <h2>Title: ${travelPackage.title}</h2>
    <p>Destination: ${travelPackage.destination.name}</p>
    <p>Photo URL: <img src="${travelPackage.photoUrl}" alt="Travel Package Photo"></p>
    <p>Duration: ${travelPackage.duration}</p>
    <p>Recommended Number of People: ${travelPackage.people}</p>
    <p>Travel Route: ${travelPackage.travelRoute}</p>
    <p>Created At: ${travelPackage.createdAt}</p>
</div>
</body>
</html>
