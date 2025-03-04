<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="daoImpl.WeatherDAOImpl, models.Weather" %>
<%
    int weatherId = Integer.parseInt(request.getParameter("id"));
    WeatherDAOImpl weatherDAO = new WeatherDAOImpl();
    Weather weather = weatherDAO.getWeatherById(weatherId);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Weather</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
<h2>Edit Weather Record</h2>
<form action="<%= request.getContextPath() %>/weather" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="<%= weather.getId() %>">

    <label>City:</label>
    <input type="text" name="city" value="<%= weather.getCity() %>" required><br>

    <label>Temperature:</label>
    <input type="text" name="temperature" value="<%= weather.getTemperature() %>" required><br>

    <label>Description:</label>
    <input type="text" name="description" value="<%= weather.getDescription() %>" required><br>

    <input type="submit" value="Update Weather">
</form>

<a href="<%= request.getContextPath() %>/weather">Back to Weather List</a>
</body>
</html>