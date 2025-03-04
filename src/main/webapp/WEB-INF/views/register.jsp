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
    <title><%= LanguageUtil.getMessage("register.title", lang) %></title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
<form action="<%= request.getContextPath() %>/auth" method="post">
    <h2><%= LanguageUtil.getMessage("register.title", lang) %></h2>

    <label><%= LanguageUtil.getMessage("register.username", lang) %>:</label>
    <input type="text" name="username" required><br>

    <label><%= LanguageUtil.getMessage("register.password", lang) %>:</label>
    <input type="password" name="password" required><br>

    <input type="hidden" name="action" value="register">
    <input type="submit" value="<%= LanguageUtil.getMessage("register.submit", lang) %>">
</form>

<!-- Language Switch -->
<a href="<%= request.getContextPath() %>/auth?action=register&lang=en">English</a> |
<a href="<%= request.getContextPath() %>/auth?action=register&lang=fr">Français</a>

<!-- Link to Login Page -->
<p>Already have an account?
    <a href="<%= request.getContextPath() %>/auth?lang=<%= lang %>">
        <%= LanguageUtil.getMessage("login.link", lang) %>
    </a>
</p>
</body>
</html>