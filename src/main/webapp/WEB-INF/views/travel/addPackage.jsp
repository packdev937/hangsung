<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hangsung.country.domain.Country" %>
<%@ page import="com.hangsung.city.domain.City" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Locale" %>
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
<script type="text/javascript">
    function checkDigit() {
        var price = document.getElementById('price').value;
        if (isNaN(price) || price == "") {
            alert("가격은 숫자만 입력해야 합니다.");
            return false;
        }

        return true;
    }

    function checkIfEmpty() {
        var price = document.getElementById('price').value;
        var title = document.getElementById('title').value;
        var country = document.getElementById('country').value;
        var city = document.getElementById('city').value;
        var people = document.getElementById('people').value;
        var duration = document.getElementById('duration').value;
        var travelRoute = document.getElementById('travelRoute').value;

        if (!price.trim()) {
            alert("가격을 입력해야 합니다.");
            return false;
        }
        if (!title.trim()) {
            alert("패키지 제목을 입력해야 합니다.");
            return false;
        }
        if (!country.trim()) {
            alert("나라를 선택해야 합니다.");
            return false;
        }
        if (!city.trim()) {
            alert("도시를 선택해야 합니다.");
            return false;
        }
        if (!people.trim()) {
            alert("추천 인원 수를 입력해야 합니다.");
            return false;
        }
        if (!duration.trim()) {
            alert("여행 기간을 선택해야 합니다.");
            return false;
        }
        if (!travelRoute.trim()) {
            alert("여행 경로를 입력해야 합니다.");
            return false;
        }

        return true; // 모든 검사를 통과하면 true를 반환
    }
</script>

<body>
<jsp:include page="../main/header.jsp"></jsp:include>
<fmt:setLocale value="${not empty param.lang ? param.lang : 'ko'}"/>
<fmt:bundle basename="messages">
    <section class="py-5">
        <form action="/travel/create" method="post" enctype="multipart/form-data" onsubmit="return checkDigit() && checkIfEmpty()">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row">
                    <div class="col-md-6">
                        <div class="row gx-4 gx-lg-5 align-items-center">
                            <h1 class="display-6 fw-bolder">✏️ <fmt:message key="submit"/></h1>
                            <p><br></p>
                            <div class="form-group row">
                                <h5><fmt:message key="title"/></h5>
                                <input type="text" id="title" name="title" class="form-control" style="width: 70%">
                            </div>
                            <hr class="my-3">
                            <div class="form-group row">
                                <h5><fmt:message key="country"/></h5>
                                <select class="form-select pt-1 mt-10" id="country" name="country" style="width: 50%"
                                        onchange="updateCities(this.value)">
                                    <% List<Country> countries = (List<Country>) request.getAttribute(
                                            "countries"); %>
                                    <% for (Country country : countries) { %>
                                    <option value="<%= country.getId() %>"><fmt:message key="<%=country.getName()%>"/>
                                    </option>
                                    <% } %>
                                </select>
                            </div>
                            <hr class="my-3">
                            <div class="form-group row">
                                <h5><fmt:message key="city"/></h5>
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
                                <h5><fmt:message key="price"/></h5>
                                <input type="text" id="price" name="price" class="form-control" style="width: 50%" >
                            </div>

                            <hr class="my-3">
                            <div class="form-group row">
                                <h5><fmt:message key="people"/></h5>
                                <input type="text" id="people" name="people" class="form-control" style="width: 50%">
                            </div>

                            <hr class="my-3">
                            <div class="form-group row">
                                <h5><fmt:message key="duration"/></h5>
                                <select class="form-select pt-1 mt-10" id="duration" name="duration" style="width: 50%">
                                    <option value="1박 2일"><fmt:message key="option1"/></option>
                                    <option value="2박 3일"><fmt:message key="option2"/></option>
                                    <option value="3박 4일"><fmt:message key="option3"/></option>
                                    <option value="4박 5일"><fmt:message key="option4"/></option>
                                    <option value="5박 6일"><fmt:message key="option5"/></option>
                                    <option value="6박 7일"><fmt:message key="option6"/></option>
                                    <option value="7박 8일"><fmt:message key="option7"/></option>
                                    <option value="8박 9일"><fmt:message key="option8"/></option>
                                    <option value="9박 10일"><fmt:message key="option9"/></option>
                                </select>
                            </div>

                            <hr class="my-3">
                            <div class="form-group row">
                                <h5><fmt:message key="travelRoute"/></h5>
                                <textarea id="travelRoute" name="travelRoute" cols="100" rows="6"
                                          class="form-control"></textarea>
                            </div>

                            <hr class="my-3">
                            <div class="form-group row">
                                <h5><fmt:message key="picture"/></h5>
                                <input type="file" id="photo" name="photo" class="form-control">
                            </div>

                            <div class="form-group row">
                                <p><br>
                                <div class="col-sm-offset-4 col-sm-push-9 text-lg-end">
                                    <input type="submit" class="btn btn-primary btn-lg"
                                           class="btn float-right" value="<fmt:message key="button"/>">
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
</fmt:bundle>>


<jsp:include page="../main/recommendPackages.jsp"/>
<%-- <jsp:include page = "footer.jsp" /> --%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
