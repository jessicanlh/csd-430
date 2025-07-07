<%--
 jessica long-heinicke 7.6.25 csd 340
 processor for update action
--%>
<%@ page import="beans.MovieBean" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="movie" class="beans.MovieBean" scope="request"/>
<jsp:setProperty name="movie" property="*"/>

<%
  // Update movie
  boolean success = movie.update();

  // Get all movies for display
  List<MovieBean> movies = MovieBean.getAllMovies();
%>
<!DOCTYPE html>
<html>
<head>
  <title>Movie Updated</title>
  <style>
    /* Same styles as create_processor.jsp */
  </style>
</head>
<body>
<div class="container">
  <a href="index.jsp" class="back-btn">Home</a>

  <% if (success) { %>
  <div class="success">
    <h2>Success!</h2>
    <p>The movie "<strong><%= movie.getTitle() %></strong>" has been updated.</p>
  </div>
  <% } else { %>
  <div class="error">
    <h2>Error</h2>
    <p>Failed to update the movie. Please try again.</p>
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
    <% for (MovieBean m : movies) { %>
    <tr>
      <td><%= m.getMovieId() %></td>
      <td><%= m.getTitle() %></td>
      <td><%= m.getDirector() %></td>
      <td><%= m.getReleaseYear() %></td>
      <td><%= m.getGenre() %></td>
      <td><%= String.format("%.1f", m.getRating()) %></td>
    </tr>
    <% } %>
    </tbody>
  </table>
</div>
</body>
</html>
