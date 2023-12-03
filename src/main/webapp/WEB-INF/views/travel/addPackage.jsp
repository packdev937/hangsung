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
            <div class="row">
                <div class="col-md-6">
                    <div class="row gx-4 gx-lg-5 align-items-center">
                        <h1 class="display-6 fw-bolder">✏️ 여행 패키지 등록</h1>
                        <p><br></p>
                        <div class="form-group row">
                            <h5>패키지 제목</h5>
                            <input type="text" id="title" name="title" class="form-control" style="width: 70%">
                        </div>
                        <hr class="my-3">
                        <div class="form-group row">
                            <h5>나라</h5>
                            <select class="form-select pt-1 mt-10" id="country" name="country" style="width: 50%"
                                    onchange="updateCities(this.value)">
                                <% List<Country> countries = (List<Country>) request.getAttribute(
                                        "countries"); %>
                                <% for (Country country : countries) { %>
                                <option value="<%= country.getId() %>"><%= country.getName() %>
                                </option>
                                <% } %>
                            </select>
                        </div>
                        <hr class="my-3">
                        <div class="form-group row">
                            <h5>도시</h5>
                            <select class="form-select pt-1 mt-10" id="city" name="city" style="width: 50%">
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
                            <input type="text" name="price" class="form-control" style="width: 50%">
                        </div>

                        <hr class="my-3">
                        <div class="form-group row">
                            <h5>추천 인원 수</h5>
                            <input type="text" name="people" class="form-control" style="width: 50%">
                        </div>

                        <hr class="my-3">
                        <div class="form-group row">
                            <h5>여행 기간</h5>
                            <select class="form-select pt-1 mt-10" id="duration" name="duration" style="width: 50%">
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
                            <textarea id="travelRoute" name="travelRoute" cols="100" rows="6"
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
                                <input type="submit" class="btn btn-primary btn-lg"
                                       class="btn float-right" value="작성하기">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2" style="margin-left: 300px; margin-top: 100px;">
                    <img src="../.././resources/images/advertisement.png" alt="Advertisement" class="img-fluid" style="margin-bottom: 50px">
                    <img src="../.././resources/images/advertisement2.png" alt="Advertisement" class="img-fluid">
                </div>
            </div>
        </div>
    </form>

</section>
<jsp:include page="../main/recommendPackages.jsp"/>
<%-- <jsp:include page = "footer.jsp" /> --%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
