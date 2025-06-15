

<%@ page import="java.util.*, com.example.Movie" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Movie Collection with JavaBeans</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

<h1>Favorite Movies with JavaBeans</h1>
<p>This page displays a list of movies using a JavaBean to hold movie details. Each record includes the movie title, director, genre, release year, and personal rating.</p>

<table>
  <thead>
  <tr>
    <th>Title</th>
    <th>Director</th>
    <th>Genre</th>
    <th>Year</th>
    <th>Rating</th>
  </tr>
  </thead>
  <tbody>
  <%
    // Create list of movies using the JavaBean
    List<Movie> movies = new ArrayList<Movie>();
    movies.add(new Movie("Sinners", "Ryan Coogler", "Drama", 2023, 8.9));
    movies.add(new Movie("Parasite", "Bong Joon-ho", "Thriller", 2019, 9.1));
    movies.add(new Movie("Interstellar", "Christopher Nolan", "Sci-Fi", 2014, 8.6));
    movies.add(new Movie("I Saw the TV Glow", "Jane Schoenbrun", "Horror", 2024, 8.0));
    movies.add(new Movie("Pride and Prejudice", "Joe Wright", "Romance", 2005, 8.2));

    for (Movie movie : movies) {
  %>
  <tr>
    <td><%= movie.getTitle() %></td>
    <td><%= movie.getDirector() %></td>
    <td><%= movie.getGenre() %></td>
    <td><%= movie.getYear() %></td>
    <td><%= movie.getRating() %></td>
  </tr>
  <%
    }
  %>
  </tbody>
</table>

</body>
</html>
