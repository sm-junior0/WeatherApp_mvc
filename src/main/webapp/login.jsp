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
  <style>
    /* Reset default styles */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: Arial, sans-serif;
      background-color: #f0f2f5;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    form {
      background-color: white;
      padding: 2rem;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 400px;
    }

    h2 {
      text-align: center;
      margin-bottom: 1.5rem;
      color: #1a73e8;
      font-size: 1.5rem;
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
      transition: border-color 0.3s ease;
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
      font-size: 1rem;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
      background-color: #1557b0;
    }

    /* Language switch styling */
    a {
      text-decoration: none;
      color: #1a73e8;
      font-size: 0.9rem;
    }

    a:hover {
      text-decoration: underline;
    }

    /*!* Language links container *!*/
    /*body > a {*/
    /*  position: absolute;*/
    /*  bottom: 1rem;*/
    /*  text-align: center;*/
    /*}*/

    /* Spacing between language links */
    /*a + a {*/
    /*  margin-left: rem;*/
    /*}*/
  </style>
</head>
<body>
<form action="<%= request.getContextPath() %>/login" method="post">
  <h2><%= LanguageUtil.getMessage("login.title", lang) %></h2>
  <label><%= LanguageUtil.getMessage("login.username", lang) %>:</label>
  <input type="text" name="username" required><br>

  <label><%= LanguageUtil.getMessage("login.password", lang) %>:</label>
  <input type="password" name="password" required><br>

  <input type="hidden" name="action" value="login">
  <input type="submit" value="<%= LanguageUtil.getMessage("login.submit", lang) %>">
</form>

<!-- Language Switch -->
<a href="<%= request.getContextPath() %>/login?lang=en">English</a> |
<a href="<%= request.getContextPath() %>/login?lang=fr">Français</a>
</body>
</html>