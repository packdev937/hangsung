<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Package Details</title>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
      $(document).ready(function () {
        $('#like-button').click(function () {
          $.ajax({
            url: '/travel/addLike',
            type: 'POST',
            data: { travelPackageId: '${travelPackage.id}' }, // 여기가 중요합니다
            success: function () {
              var likesCount = parseInt($('#likes-count').text());
              $('#likes-count').text(likesCount + 1);
            },
            error: function () {
              alert('좋아요 추가 실패');
            }
          });
        });
      });
    </script>
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
                <button id="like-button" class="btn btn-outline-primary">
                    <span id="likes-count">${travelPackage.likes}</span> 좋아요
                </button>
                <p>Created By: ${travelPackage.user.getNickname()}</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
