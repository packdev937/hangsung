<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>패키지 정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
          rel="stylesheet"/>
    <link href="../.././resources/css/style.css" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
      $(document).ready(function () {
        $('#like-button').click(function () {
          $.ajax({
            url: '/travel/addLike',
            type: 'POST',
            data: {travelPackageId: '${travelPackage.id}'},
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
    <script>
      $(document).ready(function () {
        $('#add-cart-button').click(function () {
          $.ajax({

            url: '/travel/addCart',
            type: 'POST',
            data: {travelPackageId: '${travelPackage.id}'},
            success: function () {
              alert('장바구니에 추가되었습니다!');
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

<jsp:include page="../main/header.jsp"></jsp:include>

<section class="py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0"
                                       src="/upload/${travelPackage.filename}"
                                       alt="Travel Package Picture"/></div>
            <div class="col-md-6">
                <div class="small mb-1">${travelPackage.user.getNickname()}</div>
                <h1 class="display-6 fw-bolder">${travelPackage.title}</h1>
                <div class="fs-5 mb-5">
                    <span class="text-decoration-line-through">69,000원</span>
                    <span>  59,000원</span>
                </div>
                <p>
                <h5>여행지 : ${travelPackage.city.getName()}</h5>
                <h5>추천인원 : ${travelPackage.people}</h5>
                <h5>여행 기간 : ${travelPackage.duration} </h5>
                <br>
                <p class="lead">${travelPackage.travelRoute}</p>
                <div>
                    <button id="like-button" class="btn btn-outline-dark flex-shrink-0"
                            type="button">
                        <i class="bi-heart-fill me-1"> <span
                                id="likes-count">${travelPackage.likes}</span>
                        </i>
                    </button>
                    <button id="add-cart-button" class="btn btn-success">장바구니에 추가하기</button>
                </div>
                <hr class="my-3">
                <div class="d-flex">
                    <input class="form-control text-center me-3" id="inputQuantity" type="num"
                           value="1" style="max-width: 3rem"/>
                    <button class="btn btn-outline-dark flex-shrink-0" type="button">
                        <i class="bi-cart-fill me-1"></i>
                        패키지 구매하기
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Related items section-->
<section class="py-5 bg-light">
    <div class="container px-4 px-lg-5 mt-5">
        <h2 class="fw-bolder mb-4">관련 패키지</h2>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <img class="card-img-top" src="./resources/images/P2.jpg" alt="..."/>
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">인기 패키지</h5>
                            <!-- Product price-->
                            40,000원 - 80,000원
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">패키지
                            구매하기</a></div>
                    </div>
                </div>
            </div>
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Sale badge-->
                    <div class="badge bg-dark text-white position-absolute"
                         style="top: 0.5rem; right: 0.5rem">Sale
                    </div>
                    <!-- Product image-->
                    <img class="card-img-top" src="./resources/images/P3.jpg" style="height:150px"
                         alt="..."/>
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">Special 패키지</h5>
                            <!-- Product reviews-->
                            <div class="d-flex justify-content-center small text-warning mb-2">
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                            </div>
                            <!-- Product price-->
                            <span class="text-muted text-decoration-line-through">30,000원</span>
                            28,000원
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">패키지
                            구매하기</a></div>
                    </div>
                </div>
            </div>
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Sale badge-->
                    <div class="badge bg-dark text-white position-absolute"
                         style="top: 0.5rem; right: 0.5rem">Sale
                    </div>
                    <!-- Product image-->
                    <img class="card-img-top" src="./resources/images/P4.jpg" style="height: 150px"
                         alt="..."/>
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">Sale 패키지</h5>
                            <!-- Product price-->
                            <span class="text-muted text-decoration-line-through">$50.00</span>
                            $25.00
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">패키지
                            구매하기</a></div>
                    </div>
                </div>
            </div>
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <img class="card-img-top" src="./resources/images/P5.jpg" style="height: 150px"
                         alt="..."/>
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">Popular 패키지</h5>
                            <!-- Product reviews-->
                            <div class="d-flex justify-content-center small text-warning mb-2">
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                            </div>
                            <!-- Product price-->
                            $40.00
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">패키지
                            구매하기</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%-- <jsp:include page = "footer.jsp" /> --%>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
