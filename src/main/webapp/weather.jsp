<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="daoImpl.WeatherDAOImpl, models.Weather, java.util.List" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login");
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
    <style>
        /* assets/css/styles.css */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            padding: 2rem;
            min-height: 100vh;
        }

        h2 {
            color: #1a73e8;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        h3 {
            color: #333;
            margin: 1.5rem 0 1rem;
        }

        /* Form Styling */
        form {
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: 0 auto 2rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
            font-weight: 500;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #1a73e8;
            box-shadow: 0 0 0 2px rgba(26, 115, 232, 0.2);
        }

        input[type="submit"] {
            width: 100%;
            padding: 0.75rem;
            background-color: #1a73e8;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #1557b0;
        }

        /* Table Styling */
        table {
            width: 100%;
            max-width: 800px;
            margin: 0 auto 2rem;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #1a73e8;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f0f2f5;
        }

        /* Link Styling */
        a {
            color: #1a73e8;
            text-decoration: none;
            margin: 0 0.5rem;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Utility Classes */
        .language-links {
            text-align: center;
            margin: 1rem 0;
        }

        .logout-link {
            display: block;
            text-align: center;
            margin-top: 1rem;
        }
    </style>
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
            <a href="<%= request.getContextPath() %>/weather?action=delete&id=<%= weather.getId() %>">
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