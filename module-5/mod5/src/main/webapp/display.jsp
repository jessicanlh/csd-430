<%--
 jessica long-heinicke 6.22.25 csd 430
--%>
<%@ page import="beans.Movie" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int movieId = 0;
  try {
    movieId = Integer.parseInt(request.getParameter("movieId"));
  } catch (NumberFormatException e) {
    // Handle error
  }

  Movie movie = Movie.getMovieById(movieId);
%>
<!DOCTYPE html>
<html>
<head>
  <title>Movie Details</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 40px; }
    .container { max-width: 800px; margin: 0 auto; }
    h1 { color: #2c3e50; }
    .back-btn {
      display: inline-block;
      padding: 8px 15px;
      background: #3498db;
      color: white;
      text-decoration: none;
      margin-bottom: 20px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px 0;
    }
    th, td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    th {
      background-color: #f2f2f2;
      font-weight: bold;
    }
    tr:hover { background-color: #f5f5f5; }
  </style>
</head>
<body>
<div class="container">
  <a href="select.jsp" class="back-btn">&laquo; Back to Selection</a>
  <h1>Movie Details</h1>

  <% if (movie.getTitle() != null) { %>
  <table>
    <thead>
    <tr>
      <th>Field</th>
      <th>Value</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>Movie ID</td>
      <td><%= movie.getMovieId() %></td>
    </tr>
    <tr>
      <td>Title</td>
      <td><%= movie.getTitle() %></td>
    </tr>
    <tr>
      <td>Director</td>
      <td><%= movie.getDirector() %></td>
    </tr>
    <tr>
      <td>Release Year</td>
      <td><%= movie.getReleaseYear() %></td>
    </tr>
    <tr>
      <td>Genre</td>
      <td><%= movie.getGenre() %></td>
    </tr>
    <tr>
      <td>Rating</td>
      <td><%= String.format("%.1f", movie.getRating()) %></td>
    </tr>
    </tbody>
  </table>
  <% } else { %>
  <p>No movie found with ID: <%= movieId %></p>
  <% } %>

  <h2>About This Record</h2>
  <p>This record shows complete details for the selected movie from our database.
    The information includes both identification data and artistic attributes.</p>
</div>
</body>
</html>
