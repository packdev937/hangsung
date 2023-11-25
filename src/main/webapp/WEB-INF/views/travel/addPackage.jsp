<%@ page import="com.hangsung.city.domain.City" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Travel Package</title>
</head>
<body>

<h2>Create Travel Package Form</h2>

<form action="/create" method="post">
    <div>
        <label for="title">Title:</label>
        <input type="text" id="title" name="title">
    </div>
    <div>
        <label for="destination">Destination:</label>
        <select id="destination" name="destination">
            <% List<City> cities = (List<City>) request.getAttribute("cities"); %>
            <% for (City city : cities) { %>
            <option value="<%= city.getId() %>"><%= city.getName() %>
            </option>
            <% } %>
        </select>
    </div>
    <div>
        <label for="photoUrl">Photo URL:</label>
        <input type="text" id="photoUrl" name="photoUrl">
    </div>
    <div>
        <label for="recommendedNumberOfPeople">Recommended Number of People:</label>
        <input type="number" id="recommendedNumberOfPeople" name="recommendedNumberOfPeople">
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
