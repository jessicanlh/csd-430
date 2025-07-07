-- jessica long-heinicke csd 340 7.6.25  
-- Create database
CREATE DATABASE IF NOT EXISTS CSD430;

-- Create user
CREATE USER IF NOT EXISTS 'student1'@'localhost' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON CSD430.* TO 'student1'@'localhost';
FLUSH PRIVILEGES;

-- Create table
USE CSD430;
CREATE TABLE IF NOT EXISTS jessica_movies_data (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    director VARCHAR(50) NOT NULL,
    release_year INT NOT NULL,
    genre VARCHAR(30) NOT NULL,
    rating DECIMAL(3,1) NOT NULL
);

-- Insert sample data
INSERT INTO jessica_movies_data (title, director, release_year, genre, rating)
VALUES
('Inception', 'Christopher Nolan', 2010, 'Sci-Fi', 8.8),
('The Shawshank Redemption', 'Frank Darabont', 1994, 'Drama', 9.3),
('The Dark Knight', 'Christopher Nolan', 2008, 'Action', 9.0),
('Pulp Fiction', 'Quentin Tarantino', 1994, 'Crime', 8.9),
('Forrest Gump', 'Robert Zemeckis', 1994, 'Drama', 8.8);