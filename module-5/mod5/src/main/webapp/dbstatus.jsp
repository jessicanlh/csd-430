<%--
  jessica long-heinicke 6.22.25 csd 430
--%>
<%@ page import="util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String message;
  try (Connection conn = DBConnection.getConnection()) {
    message = "✅ Database connection successful!";
  } catch (Exception e) {
    message = "❌ Database error: " + e.getMessage();
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Database Status</title>
  <style>body { font-family: Arial, sans-serif; margin: 40px; }</style>
</head>
<body>
<h1>Database Connection Test</h1>
<p><%= message %></p>
<a href="index.jsp">Back to Home</a>
</body>
</html>
