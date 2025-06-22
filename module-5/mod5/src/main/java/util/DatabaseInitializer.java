// jessica long-heinicke 6.22.25
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseInitializer {

    public static void initializeDatabase() {
        final String DB_URL = "jdbc:mysql://localhost:3306/";
        final String USER = "root"; // Use your MySQL admin credentials
        final String PASS = "your_root_password"; // Change to your actual root password

        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
             Statement stmt = conn.createStatement()) {

            // Create database
            stmt.executeUpdate("CREATE DATABASE IF NOT EXISTS CSD430");
            System.out.println("Database created/exists: CSD430");

            // Switch to new database
            stmt.executeUpdate("USE CSD430");

            // Create user and grant privileges
            stmt.executeUpdate("CREATE USER IF NOT EXISTS 'student1'@'localhost' IDENTIFIED BY 'pass'");
            stmt.executeUpdate("GRANT ALL PRIVILEGES ON CSD430.* TO 'student1'@'localhost'");
            stmt.executeUpdate("FLUSH PRIVILEGES");
            System.out.println("User student1 created");

            // Create table
            String createTableSQL = "CREATE TABLE IF NOT EXISTS jessica_movies_data (" +
                    "movie_id INT AUTO_INCREMENT PRIMARY KEY, " +
                    "title VARCHAR(100) NOT NULL, " +
                    "director VARCHAR(50) NOT NULL, " +
                    "release_year INT NOT NULL, " +
                    "genre VARCHAR(30) NOT NULL, " +
                    "rating DECIMAL(3,1) NOT NULL)";
            stmt.executeUpdate(createTableSQL);
            System.out.println("Table created/exists: jessica_movies_data");

            // Insert sample data
            String insertDataSQL = "INSERT IGNORE INTO jessica_movies_data (title, director, release_year, genre, rating) VALUES " +
                    "('Inception', 'Christopher Nolan', 2010, 'Sci-Fi', 8.8), " +
                    "('The Shawshank Redemption', 'Frank Darabont', 1994, 'Drama', 9.3), " +
                    "('The Dark Knight', 'Christopher Nolan', 2008, 'Action', 9.0), " +
                    "('Pulp Fiction', 'Quentin Tarantino', 1994, 'Crime', 8.9), " +
                    "('Forrest Gump', 'Robert Zemeckis', 1994, 'Drama', 8.8), " +
                    "('The Matrix', 'Lana Wachowski', 1999, 'Sci-Fi', 8.7), " +
                    "('Goodfellas', 'Martin Scorsese', 1990, 'Crime', 8.7), " +
                    "('Parasite', 'Bong Joon Ho', 2019, 'Thriller', 8.6), " +
                    "('Whiplash', 'Damien Chazelle', 2014, 'Drama', 8.5), " +
                    "('Mad Max: Fury Road', 'George Miller', 2015, 'Action', 8.1)";
            stmt.executeUpdate(insertDataSQL);
            System.out.println("Sample data inserted");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}