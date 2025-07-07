<%--
 Jessica Long-Heinicke csd 430 7.6.25
 processor to create new entries in database
--%>
<%@ page import="beans.MovieBean" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="newMovie" class="beans.MovieBean" scope="request"/>
<jsp:setProperty name="newMovie" property="*"/>

<%
    // Insert movie and get result
    boolean success = newMovie.insert();

    // Get all movies for display
    List<MovieBean> movies = MovieBean.getAllMovies();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Movie Added</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .container { max-width: 800px; margin: 0 auto; }
        .success {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 4px;
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
        .back-btn {
            display: inline-block;
            padding: 8px 15px;
            background: #3498db;
            color: white;
            text-decoration: none;
            margin-bottom: 20px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <a href="create.jsp" class="back-btn">&laquo; Add Another Movie</a>
    <a href="index.jsp" class="back-btn">Home</a>

    <% if (success) { %>
    <div class="success">
        <h2>Success!</h2>
        <p>The movie "<strong><%= newMovie.getTitle() %></strong>" has been added to the database.</p>
    </div>
    <% } else { %>
    <div class="error">
        <h2>Error</h2>
        <p>Failed to add the movie. Please try again.</p>
    </div>
    <% } %>

    <h2>All Movies in Database</h2>
    <p>Below is the complete list of movies currently stored in our database:</p>

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

    <div class="data-description">
        <h3>About Our Movie Database</h3>
        <p>This database contains detailed information about various films. Each record includes:</p>
        <ul>
            <li><strong>Movie ID</strong>: Unique identifier (auto-generated)</li>
            <li><strong>Title</strong>: Official name of the film</li>
            <li><strong>Director</strong>: Primary director of the film</li>
            <li><strong>Release Year</strong>: Year the film was released</li>
            <li><strong>Genre</strong>: Primary genre classification</li>
            <li><strong>Rating</strong>: Average critic rating (0-10 scale)</li>
        </ul>
        <p>Total movies in collection: <strong><%= movies.size() %></strong></p>
    </div>
</div>
</body>
</html>