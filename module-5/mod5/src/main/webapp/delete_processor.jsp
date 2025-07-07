<%--
jessica long-heinicke 7.6.25 csd 430
procesor for delete action
--%>
<%@ page import="beans.MovieBean" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int movieId = Integer.parseInt(request.getParameter("movieId"));
  boolean success = MovieBean.delete(movieId);
  List<MovieBean> movies = MovieBean.getAllMovies();
%>
<!DOCTYPE html>
<html>
<head>
  <title>Movie Deleted</title>
  <style>
    /* Same styles as create_processor.jsp */
  </style>
</head>
<body>
<div class="container">
  <a href="delete.jsp" class="back-btn">Back to Delete</a>
  <a href="index.jsp" class="back-btn">Home</a>

  <% if (success) { %>
  <div class="success">
    <h2>Success!</h2>
    <p>The movie has been deleted from the database.</p>
  </div>
  <% } else { %>
  <div class="error">
    <h2>Error</h2>
    <p>Failed to delete the movie. Please try again.</p>
  </div>
  <% } %>

  <h2>Updated Movie List</h2>
  <table>
    <thead>
    <tr>
      <th>ID</th>
      <th>Title</th>
      <th>Director</th>
      <th>Year</th>
      <th>Genre</th>
      <th>Rating</th>
    </tr>
    </thead>
    <tbody>
    <% for (MovieBean movie : movies) { %>
    <tr>
      <td><%= movie.getMovieId() %></td>
      <td><%= movie.getTitle() %></td>
      <td><%= movie.getDirector() %></td>
      <td><%= movie.getReleaseYear() %></td>
      <td><%= movie.getGenre() %></td>
      <td><%= String.format("%.1f", movie.getRating()) %></td>
    </tr>
    <% } %>
    </tbody>
  </table>
</div>
</body>
</html>