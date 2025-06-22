// jessica long-heinicke 6.22.25 csd430
package beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Movie {
    private int movieId;
    private String title;
    private String director;
    private int releaseYear;
    private String genre;
    private double rating;

    // Getters and Setters
    public int getMovieId() { return movieId; }
    public void setMovieId(int movieId) { this.movieId = movieId; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getDirector() { return director; }
    public void setDirector(String director) { this.director = director; }
    public int getReleaseYear() { return releaseYear; }
    public void setReleaseYear(int releaseYear) { this.releaseYear = releaseYear; }
    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }
    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }

    // Get all movie IDs for dropdown
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movieIds;
    }

    // Get movie by ID
    public static Movie getMovieById(int id) {
        Movie movie = new Movie();
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
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movie;
    }
}