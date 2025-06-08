<%-- Jessica Long-Heinicke Module 3 Assignment 6.8.25 --%>
<%-- Retrieves info submitted into the feedback form --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Feedback Results</title>
</head>
<body>
<h2>Your Restaurant Feedback Summary</h2>
<p>Below is a summary of your feedback:</p>

<%
  // Retrieve submitted form data
  String name = request.getParameter("name");
  String email = request.getParameter("email");
  String mealRating = request.getParameter("mealRating");
  String service = request.getParameter("service");
  String comments = request.getParameter("comments");
%>

<%-- Format the results --%>
<table border="1" cellpadding="8">
  <tr>
    <th>Field</th>
    <th>Your Input</th>
  </tr>
  <tr>
    <td>Name</td>
    <td><%= name %></td>
  </tr>
  <tr>
    <td>Email</td>
    <td><%= email %></td>
  </tr>
  <tr>
    <td>Meal Rating</td>
    <td><%= mealRating %></td>
  </tr>
  <tr>
    <td>Service Satisfaction</td>
    <td><%= service %></td>
  </tr>
  <tr>
    <td>Additional Comments</td>
    <td><%= comments != null && !comments.trim().isEmpty() ? comments : "No additional comments provided." %></td>
  </tr>
</table>
</body>
</html>


