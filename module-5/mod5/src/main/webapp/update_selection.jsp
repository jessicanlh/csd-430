<%--
Jessica Long-Heinicke 7.6.25 csd 430

--%>
<%@ page import="beans.MovieBean" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Select Movie to Update</title>
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
        .back-link { display: inline-block; margin-top: 20px; }
    </style>
</head>
<body>
<div class="container">
    <h1>Update Movie Record</h1>
    <p>Select a movie to update from the dropdown:</p>

    <%
        List<MovieBean> movies = MovieBean.getAllMovies();
        if (movies.isEmpty()) {
    %>
    <p>No movies found in database!</p>
    <a href="index.jsp">Return to Home</a>
    <% } else { %>
    <form action="update_form.jsp" method="GET">
        <select name="movieId" required>
            <option value="">-- Select Movie --</option>
            <% for (MovieBean movie : movies) { %>
            <option value="<%= movie.getMovieId() %>">
                <%= movie.getTitle() %> (ID: <%= movie.getMovieId() %>)
            </option>
            <% } %>
        </select>
        <button type="submit">Select Movie</button>
    </form>
    <% } %>
    <a href="index.jsp" class="back-link">Back to Home</a>
</div>
</body>
</html>