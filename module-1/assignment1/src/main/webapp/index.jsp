<%--Jessica Long-Heinicke CSD 430 Assignment 1.1
Sample program to show that everything is working and installed correctly--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP Test</title>
    <style>
        body { font-family: Arial; margin: 20px; }
        .success { color: #2ecc71; font-weight: bold; }
    </style>
</head>
<body>
<h1>JSP Setup Verification</h1>

<%-- Java Code Block --%>
<%
    Date now = new Date();
    String message = "✓ JSP is functioning!";
%>

<!-- HTML Output -->
<p class="success"><%= message %></p>
<p>Server time: <%= now %></p>

<h3>Environment Info:</h3>
<ul>
    <li>Java Version: <%= System.getProperty("java.version") %></li>
    <li>Server: <%= application.getServerInfo() %></li>
</ul>
</body>
</html>