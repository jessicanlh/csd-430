//Jessica Long-Heinicke CSD 430 module 2 6.1.25
//file to create index.jsp displaying five favorite movies by title, director, and genre


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Favorite Movies</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h1>Favorite Movies I've Watched</h1>
<p>This table lists some of the most impactful movies I've watched recently. It includes the movie title, the director's name, and the genre.</p>

<table>
    <thead>
    <tr>
        <th>Title</th>
        <th>Director</th>
        <th>Genre</th>
    </tr>
    </thead>
    <tbody>
    <%
        // Define a class to represent a Movie record
        class Movie {
            String title, director, genre;

            Movie(String title, String director, String genre) {
                this.title = title;
                this.director = director;
                this.genre = genre;
            }
        }

        // Create a list of Movie records
        List<Movie> movies = new ArrayList<Movie>();
        movies.add(new Movie("Sinners", "Ryan Coogler", "Drama"));
        movies.add(new Movie("Parasite", "Bong Joon-ho", "Thriller"));
        movies.add(new Movie("Interstellar", "Christopher Nolan", "Sci-Fi"));
        movies.add(new Movie("I Saw the TV Glow", "Jane Schoenbrun", "Horror"));
        movies.add(new Movie("Pride and Prejudice (2005)", "Joe Wright", "Romance"));

        // Output table rows using scriptlet
        for (Movie movie : movies) {
    %>
    <tr>
        <td><%= movie.title %></td>
        <td><%= movie.director %></td>
        <td><%= movie.genre %></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>
