<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Weather Management System</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
<h2>Welcome to the Weather Management System</h2>
<a href="<%= request.getContextPath() %>/weather">View Weather Data</a> |
<a href="<%= request.getContextPath() %>/register">Register</a>
</body>
</html>