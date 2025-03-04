<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="daoImpl.WeatherDAOImpl, models.Weather, java.util.List" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/auth");
        return;
    }

    WeatherDAOImpl weatherDAO = new WeatherDAOImpl();
    List<Weather> weatherList = weatherDAO.getAllWeather();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Weather Data</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
<h2>Welcome ${user.username}</h2>
<h2>Weather Records</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>City</th>
        <th>Temperature</th>
        <th>Description</th>
        <th>Actions</th>
    </tr>
    <% for (Weather weather : weatherList) { %>
    <tr>
        <td><%= weather.getId() %></td>
        <td><%= weather.getCity() %></td>
        <td><%= weather.getTemperature() %></td>
        <td><%= weather.getDescription() %></td>
        <td>
            <a href="<%= request.getContextPath() %>/weather?action=edit&id=<%= weather.getId() %>">Edit</a> |
            <a href="<%= request.getContextPath() %>/weather?action=delete&id=<%= weather.getId() %>"
               onclick="return confirm('Are you sure you want to delete this record?');">
                Delete
            </a>
        </td>
    </tr>
    <% } %>
</table>

<h3>Add New Weather Record</h3>
<form action="<%= request.getContextPath() %>/weather" method="post">
    <input type="hidden" name="action" value="add">
    <label>City:</label>
    <input type="text" name="city" required><br>

    <label>Temperature:</label>
    <input type="text" name="temperature" required><br>

    <label>Description:</label>
    <input type="text" name="description" required><br>

    <input type="submit" value="Add Weather">
</form>

<a href="<%= request.getContextPath() %>/logout">Logout</a>
</body>
</html>