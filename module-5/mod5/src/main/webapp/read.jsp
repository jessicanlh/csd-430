<%--
  jessica long-heinicke 6.22.25 csd  430
  update 7.6.25
--%>
<%@ page import="beans.MovieBean" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Movies</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .container { max-width: 1000px; margin: 0 auto; }
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
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #3498db;
            color: white;
            font-weight: bold;
        }
        tr:nth-child(even) { background-color: #f8f9fa; }
        tr:hover { background-color: #f1f5f9; }
    </style>
</head>
<body>
<div class="container">
    <a href="index.jsp" class="back-btn">Home</a>
    <h1>All Movies in Database</h1>

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
        <%
            List<MovieBean> movies = MovieBean.getAllMovies();
            for (MovieBean movie : movies) {
        %>
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

    <div class="data-info">
        <h2>Database Information</h2>
        <p>Total movies: <strong><%= movies.size() %></strong></p>
        <p>Table name: <code>jessica_movies_data</code></p>
        <p>Database: <code>CSD430</code></p>
        <p>User: <code>student1@localhost</code></p>
    </div>
</div>
</body>
</html>