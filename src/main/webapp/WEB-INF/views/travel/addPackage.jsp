<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hangsung.country.domain.Country" %>
<%@ page import="com.hangsung.city.domain.City" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>hangsung</title>
    <link rel="icon" type="image/x-icon" href="../assets/favicon.ico"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
          rel="stylesheet"/>
    <link href="../.././resources/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>

<section class="py-5">
    <form action="/travel/create" method="post" enctype="multipart/form-data">
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center">
                <div class="col-md-6">
                    <h1 class="display-6 fw-bolder">여행 패키지 등록</h1>
                    <p><br></p>
                    <div class="form-group row">
                        <h5>패키지 제목</h5>
                        <input type="text" id="title" name="title" class="form-control">
                    </div>

                    <hr class="my-3">
                    <div class="form-group row">
                        <h5>나라</h5>
                        <select id="country" name="country" onchange="updateCities(this.value)">
                            <% List<Country> countries = (List<Country>) request.getAttribute(
                                    "countries"); %>
                            <% for (Country country : countries) { %>
                            <option value="<%= country.getId() %>"><%= country.getName() %>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <br>
                    <div class="form-group row">
                        <h5>도시</h5>
                        <select id="city" name="city">
                            <script type="text/javascript">
                              document.getElementById('country').addEventListener('change',
                                  function () {
                                    var countryId = this.value;
                                    var citiesSelect = document.getElementById('city');
                                    citiesSelect.innerHTML = '';

                                    <% for (Country country : countries) { %>
                                    if (countryId == '<%= country.getId() %>') {
                                      <% for (City city : country.getCities()) { %>
                                      var option = new Option('<%= city.getName() %>',
                                          '<%= city.getId() %>');
                                      citiesSelect.add(option);
                                      <% } %>
                                    }
                                    <% } %>
                                  });
                            </script>
                        </select>
                    </div>

                    <hr class="my-3">
                    <div class="form-group row">
                        <h5>가격</h5>
                        <input type="text" name="price" class="form-control">
                    </div>

                    <hr class="my-3">
                    <div class="form-group row">
                        <h5>추천 인원 수</h5>
                        <input type="text" name="people" class="form-control">
                    </div>

                    <hr class="my-3">
                    <div class="form-group row">
                        <h5>여행 기간</h5>
                        <select class="form-select pt-1 mt-10" id="duration" name="duration">
                            <option value="1박 2일">1박 2일</option>
                            <option value="2박 3일">2박 3일</option>
                            <option value="3박 4일">3박 4일</option>
                            <option value="4박 5일">4박 5일</option>
                            <option value="5박 6일">5박 6일</option>
                            <option value="6박 7일">6박 7일</option>
                            <option value="7박 8일">7박 8일</option>
                            <option value="8박 9일">8박 9일</option>
                            <option value="9박 10일">9박 10일</option>
                        </select>
                    </div>

                    <hr class="my-3">
                    <div class="form-group row">
                        <h5>여행 경로</h5>
                        <textarea id="travelRoute" name="travelRoute" cols="50" rows="3"
                                  class="form-control"></textarea>
                    </div>

                    <hr class="my-3">
                    <div class="form-group row">
                        <h5>패키지 사진</h5>
                        <input type="file" id="photo" name="photo" class="form-control">
                    </div>

                    <div class="form-group row">
                        <p><br>
                        <div class="col-sm-offset-4 col-sm-push-9 text-lg-end">
                            <input type="submit" class="btn btn-outline-secondary btn-lg"
                                   class="btn float-right" value="작성하기">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
