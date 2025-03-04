<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="utility.LanguageUtil" %>
<%
    String lang = request.getParameter("lang");
    if (lang == null) lang = "en";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= LanguageUtil.getMessage("login.title", lang) %></title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
<form action="<%= request.getContextPath() %>/auth" method="post">
    <h2><%= LanguageUtil.getMessage("login.title", lang) %></h2>
    <label><%= LanguageUtil.getMessage("login.username", lang) %>:</label>
    <input type="text" name="username" required><br>

    <label><%= LanguageUtil.getMessage("login.password", lang) %>:</label>
    <input type="password" name="password" required><br>

    <input type="hidden" name="action" value="login">
    <input type="submit" value="<%= LanguageUtil.getMessage("login.submit", lang) %>">
</form>

<!-- Language Switch -->
<a href="<%= request.getContextPath() %>/auth?lang=en">English</a> |
<a href="<%= request.getContextPath() %>/auth?lang=fr">Français</a>
</body>
</html>