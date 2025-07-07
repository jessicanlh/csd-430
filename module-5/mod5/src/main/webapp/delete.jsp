<%--
  jessica long-heinicke 6.22.25 csd  430
  delete entries in database
--%>
<%@ page import="beans.MovieBean" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Movie</title>
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
        .delete-btn {
            background: #e74c3c;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
        }
        .delete-btn:hover { background: #c0392b; }
    </style>
</head>
<body>
<div class="container">
    <a href="index.jsp" class="back-btn">Home</a>
    <h1>Delete Movie Record</h1>
    <p>Select a movie to delete:</p>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Director</th>
            <th>Year</th>
            <th>Genre</th>
            <th>Rating</th>
            <th>Action</th>
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
            <td>
                <form action="delete_processor.jsp" method="POST"
                      onsubmit="return confirm('Are you sure you want to delete <%= movie.getTitle() %>?')">
                    <input type="hidden" name="movieId" value="<%= movie.getMovieId() %>">
                    <button type="submit" class="delete-btn">Delete</button>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>