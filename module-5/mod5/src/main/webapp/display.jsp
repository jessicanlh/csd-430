<%--
 jessica long-heinicke 6.22.25 csd 430
 update 7.6.25
 display entries
--%>
<%@ page import="beans.MovieBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int movieId = 0;
  String error = null;

  try {
    movieId = Integer.parseInt(request.getParameter("movieId"));
  } catch (NumberFormatException e) {
    error = "Invalid movie ID format";
  }

  MovieBean movie = null;
  if (error == null) {
    movie = MovieBean.getMovieById(movieId);
    if (movie.getTitle() == null) {
      error = "No movie found with ID: " + movieId;
    }
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Movie Details</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 40px; }
    .container { max-width: 800px; margin: 0 auto; }
    .back-btn {
      display: inline-block;
      padding: 8px 15px;
      background: #3498db;
      color: white;
      text-decoration: none;
      margin-bottom: 20px;
    }
    .error { color: red; }
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
      width: 30%;
    }
  </style>
</head>
<body>
<div class="container">
  <a href="select.jsp" class="back-btn">&laquo; Back to Selection</a>

  <% if (error != null) { %>
  <h1>Error</h1>
  <p class="error"><%= error %></p>
  <% } else { %>
  <h1>Movie Details: <%= movie.getTitle() %></h1>
  <table>
    <tr>
      <th>Movie ID</th>
      <td><%= movie.getMovieId() %></td>
    </tr>
    <tr>
      <th>Title</th>
      <td><%= movie.getTitle() %></td>
    </tr>
    <tr>
      <th>Director</th>
      <td><%= movie.getDirector() %></td>
    </tr>
    <tr>
      <th>Release Year</th>
      <td><%= movie.getReleaseYear() %></td>
    </tr>
    <tr>
      <th>Genre</th>
      <td><%= movie.getGenre() %></td>
    </tr>
    <tr>
      <th>Rating</th>
      <td><%= String.format("%.1f", movie.getRating()) %>/10</td>
    </tr>
  </table>

  <div class="record-info">
    <h2>About This Record</h2>
    <p>This record shows complete details for the selected movie from our database.
      The information is stored in our MySQL database under the table
      <code>jessica_movies_data</code> and was retrieved using a JavaBean
      with JDBC database connectivity.</p>
  </div>
  <% } %>
</div>
</body>
</html>