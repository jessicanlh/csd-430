<%--
 jessica long-heinicke 6.22.25 csd 430
--%>
<%@ page import="beans.Movie" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Select Movie</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 40px; }
    .container { max-width: 600px; margin: 0 auto; }
    h1 { color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
    form { margin: 20px 0; }
    select, button {
      padding: 10px;
      font-size: 16px;
      margin: 10px 0;
      width: 100%;
    }
    button {
      background: #3498db;
      color: white;
      border: none;
      cursor: pointer;
    }
    button:hover { background: #2980b9; }
  </style>
</head>
<body>
<div class="container">
  <h1>Movie Database Viewer</h1>
  <p>Select a movie from the dropdown to view its details:</p>

  <form action="display.jsp" method="GET">
    <select name="movieId" required>
      <option value="">-- Select Movie ID --</option>
      <%
        List<Integer> movieIds = Movie.getAllMovieIds();
        for (int id : movieIds) {
      %>
      <option value="<%= id %>">Movie #<%= id %></option>
      <% } %>
    </select>
    <button type="submit">View Details</button>
  </form>
</div>
</body>
</html>
