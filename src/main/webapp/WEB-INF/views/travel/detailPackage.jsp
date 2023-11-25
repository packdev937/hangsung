<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Package Details</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-8">
            <h1>${travelPackage.title}</h1>
            <img src="/upload/${travelPackage.filename}" alt="Travel Package Picture">
            <div>
                <p>Destination: ${travelPackage.destination.name}</p>
                <p>Duration: ${travelPackage.duration} days</p>
                <p>Recommended Number of People: ${travelPackage.people}</p>
                <p>Travel Route: ${travelPackage.travelRoute}</p>
                <p>Created At: ${travelPackage.createdAt}</p>
                <p>Created By: ${travelPackage.user.getNickname()}</p>
            </div>
        </div>
    </div>
</div>
<script src="path-to-jquery"></script>
<script src="path-to-popper"></script>
<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
