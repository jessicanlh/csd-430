// Jessica Long-Heinicke 7.6.25 csd 430

package beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieBean {
    private int movieId;
    private String title;
    private String director;
    private int releaseYear;
    private String genre;
    private double rating;

    // Default constructor
    public MovieBean() {}

    // Getters and Setters
    public int getMovieId() { return movieId; }
    public void setMovieId(int movieId) {
        System.out.println("Setting movieId: " + movieId);
        this.movieId = movieId;
    }

    public String getTitle() { return title; }
    public void setTitle(String title) {
        System.out.println("Setting title: " + title);
        this.title = title;
    }

    public String getDirector() { return director; }
    public void setDirector(String director) {
        System.out.println("Setting director: " + director);
        this.director = director;
    }

    public int getReleaseYear() { return releaseYear; }
    public void setReleaseYear(int releaseYear) {
        System.out.println("Setting releaseYear: " + releaseYear);
        this.releaseYear = releaseYear;
    }

    public String getGenre() { return genre; }
    public void setGenre(String genre) {
        System.out.println("Setting genre: " + genre);
        this.genre = genre;
    }

    public double getRating() { return rating; }
    public void setRating(double rating) {
        System.out.println("Setting rating: " + rating);
        this.rating = rating;
    }

    // Insert movie into database
    public boolean insert() {
        String sql = "INSERT INTO jessica_movies_data (title, director, release_year, genre, rating) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, this.title);
            pstmt.setString(2, this.director);
            pstmt.setInt(3, this.releaseYear);
            pstmt.setString(4, this.genre);
            pstmt.setDouble(5, this.rating);

            int rowsAffected = pstmt.executeUpdate();
            System.out.println("INSERT: Rows affected - " + rowsAffected);
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.err.println("INSERT ERROR: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // Get all movies from database
    public static List<MovieBean> getAllMovies() {
        List<MovieBean> movies = new ArrayList<>();
        String sql = "SELECT * FROM jessica_movies_data";

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                MovieBean movie = new MovieBean();
                movie.setMovieId(rs.getInt("movie_id"));
                movie.setTitle(rs.getString("title"));
                movie.setDirector(rs.getString("director"));
                movie.setReleaseYear(rs.getInt("release_year"));
                movie.setGenre(rs.getString("genre"));
                movie.setRating(rs.getDouble("rating"));
                movies.add(movie);
            }
            System.out.println("GET ALL: Found " + movies.size() + " movies");
        } catch (SQLException e) {
            System.err.println("GET ALL ERROR: " + e.getMessage());
            e.printStackTrace();
        }
        return movies;
    }

    // Get movie by ID
    public static MovieBean getMovieById(int id) {
        MovieBean movie = new MovieBean();
        String sql = "SELECT * FROM jessica_movies_data WHERE movie_id = ?";

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    movie.setMovieId(rs.getInt("movie_id"));
                    movie.setTitle(rs.getString("title"));
                    movie.setDirector(rs.getString("director"));
                    movie.setReleaseYear(rs.getInt("release_year"));
                    movie.setGenre(rs.getString("genre"));
                    movie.setRating(rs.getDouble("rating"));
                    System.out.println("GET BY ID: Found movie - " + movie.getTitle());
                } else {
                    System.out.println("GET BY ID: No movie found for ID " + id);
                }
            }
        } catch (SQLException e) {
            System.err.println("GET BY ID ERROR: " + e.getMessage());
            e.printStackTrace();
        }
        return movie;
    }

    // Update movie - DEBUGGED VERSION
    public boolean update() {
        String sql = "UPDATE jessica_movies_data SET title = ?, director = ?, release_year = ?, genre = ?, rating = ? WHERE movie_id = ?";

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Debug parameters before execution
            System.out.println("UPDATE PARAMS:");
            System.out.println("1. Title: " + this.title);
            System.out.println("2. Director: " + this.director);
            System.out.println("3. Year: " + this.releaseYear);
            System.out.println("4. Genre: " + this.genre);
            System.out.println("5. Rating: " + this.rating);
            System.out.println("6. Movie ID: " + this.movieId);

            pstmt.setString(1, this.title);
            pstmt.setString(2, this.director);
            pstmt.setInt(3, this.releaseYear);
            pstmt.setString(4, this.genre);
            pstmt.setDouble(5, this.rating);
            pstmt.setInt(6, this.movieId);

            int rowsAffected = pstmt.executeUpdate();
            System.out.println("UPDATE: Rows affected - " + rowsAffected);

            // Additional debug - show generated SQL
            System.out.println("EXECUTED SQL: " + pstmt.toString());

            return rowsAffected > 0;

        } catch (SQLException e) {
            System.err.println("UPDATE ERROR: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // Delete movie
    public static boolean delete(int movieId) {
        String sql = "DELETE FROM jessica_movies_data WHERE movie_id = ?";

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, movieId);
            int rowsAffected = pstmt.executeUpdate();
            System.out.println("DELETE: Rows affected - " + rowsAffected);
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.err.println("DELETE ERROR: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // Get all movie IDs (for dropdowns)
    public static List<Integer> getAllMovieIds() {
        List<Integer> movieIds = new ArrayList<>();
        String sql = "SELECT movie_id FROM jessica_movies_data";

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                movieIds.add(rs.getInt("movie_id"));
            }
            System.out.println("GET IDs: Found " + movieIds.size() + " movie IDs");
        } catch (SQLException e) {
            System.err.println("GET IDs ERROR: " + e.getMessage());
            e.printStackTrace();
        }
        return movieIds;
    }

    // Debug method to show current state
    public String debugString() {
        return String.format(
                "MovieBean [id=%d, title=%s, director=%s, year=%d, genre=%s, rating=%.1f]",
                movieId, title, director, releaseYear, genre, rating
        );
    }
}