<%--
  Created by IntelliJ IDEA.
  User: jessica
  Date: 6/22/25
  Time: 2:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="beans.MovieBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int movieId = 0;
    MovieBean movie = new MovieBean();
    if (request.getParameter("movieId") != null) {
        movieId = Integer.parseInt(request.getParameter("movieId"));
        movie = MovieBean.getMovieById(movieId);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Movie</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .container { max-width: 600px; margin: 0 auto; }
        h1 { color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 8px; font-weight: bold; }
        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background: #3498db;
            color: white;
            border: none;
            padding: 12px 24px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }
        button:hover { background: #2980b9; }
        .delete-btn { background: #e74c3c; }
        .delete-btn:hover { background: #c0392b; }
        .back-link { display: inline-block; margin-top: 20px; }
    </style>
</head>
<body>
<div class="container">
    <h1>Update Movie: <%= movie.getTitle() %></h1>
    <form action="update_processor.jsp" method="POST">
        <input type="hidden" name="movieId" value="<%= movie.getMovieId() %>">

        <div class="form-group">
            <label for="title">Movie Title:</label>
            <input type="text" id="title" name="title" value="<%= movie.getTitle() %>" required>
        </div>

        <div class="form-group">
            <label for="director">Director:</label>
            <input type="text" id="director" name="director" value="<%= movie.getDirector() %>" required>
        </div>

        <div class="form-group">
            <label for="releaseYear">Release Year:</label>
            <input type="number" id="releaseYear" name="releaseYear" min="1900" max="2025"
                   value="<%= movie.getReleaseYear() %>" required>
        </div>

        <div class="form-group">
            <label for="genre">Genre:</label>
            <select id="genre" name="genre" required>
                <option value="<%= movie.getGenre() %>" selected><%= movie.getGenre() %></option>
                <option value="Action">Action</option>
                <option value="Comedy">Comedy</option>
                <option value="Drama">Drama</option>
                <option value="Sci-Fi">Sci-Fi</option>
                <option value="Horror">Horror</option>
                <option value="Thriller">Thriller</option>
                <option value="Crime">Crime</option>
                <option value="Adventure">Adventure</option>
            </select>
        </div>

        <div class="form-group">
            <label for="rating">Rating (0-10):</label>
            <input type="number" id="rating" name="rating" step="0.1" min="0" max="10"
                   value="<%= movie.getRating() %>" required>
        </div>

        <button type="submit">Update Movie</button>
        <a href="delete.jsp?movieId=<%= movie.getMovieId() %>" class="delete-btn">Delete Movie</a>
    </form>
    <a href="index.jsp" class="back-link">Back to Home</a>
</div>
</body>
</html>