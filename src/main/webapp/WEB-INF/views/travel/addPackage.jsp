<%@ page import="com.hangsung.city.domain.City" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hangsung.country.domain.Country" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>여행 패키지 생성하기</title>
</head>
<body>
<h2>여행 패키지 생성</h2>

<form action="/travel/create" method="post" enctype="multipart/form-data">
    <div>
        <label for="title">패키지 제목:</label>
        <input type="text" id="title" name="title">
    </div>
    <div>
        <label for="country">Country:</label>
        <select id="country" name="country" onchange="updateCities(this.value)">
            <% List<Country> countries = (List<Country>) request.getAttribute("countries"); %>
            <% for (Country country : countries) { %>
            <option value="<%= country.getId() %>"><%= country.getName() %>
            </option>
            <% } %>
        </select>
    </div>

    <div>
        <label for="city">City:</label>
        <select id="city" name="city">
            <script type="text/javascript">
              document.getElementById('country').addEventListener('change', function () {
                var countryId = this.value;
                var citiesSelect = document.getElementById('city');
                citiesSelect.innerHTML = '';

                <% for (Country country : countries) { %>
                if (countryId == '<%= country.getId() %>') {
                  <% for (City city : country.getCities()) { %>
                  var option = new Option('<%= city.getName() %>', '<%= city.getId() %>');
                  citiesSelect.add(option);
                  <% } %>
                }
                <% } %>
              });
            </script>
        </select>
    </div>
    <div>
        <label for="photo">Photo URL:</label>
        <input type="file" id="photo" name="photo">
    </div>
    <div>
        <label for="people">Recommended Number of People:</label>
        <input type="number" id="people" name="people">
    </div>
    <div>
        <label for="duration">Duration</label>
        <select id="duration" name="duration">
            <option value="1">1박 2일</option>
            <option value="2">2박 3일</option>
            <option value="3">3박 4일</option>
            <option value="4">4박 5일</option>
            <option value="5">5박 6일</option>
            <option value="6">6박 7일</option>
            <option value="7">7박 8일</option>
            <option value="8">8박 9일</option>
            <option value="9">9박 10일</option>
        </select>
    </div>

    <div>
        <label for="travelRoute">Travel Route:</label>
        <textarea id="travelRoute" name="travelRoute"></textarea>
    </div>
    <div>
        <input type="submit" value="Submit">
    </div>
</form>
</body>
</html>
