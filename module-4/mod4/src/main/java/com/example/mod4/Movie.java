//Jessica Long-Heinicke Mod4 6.15.25 CSD 430

package com.example;

import java.io.Serializable;

/**
 * JavaBean representing a Movie.
 */
public class Movie implements Serializable {
    private String title;
    private String director;
    private String genre;
    private int year;
    private double rating;

    public Movie() {}

    public Movie(String title, String director, String genre, int year, double rating) {
        this.title = title;
        this.director = director;
        this.genre = genre;
        this.year = year;
        this.rating = rating;
    }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDirector() { return director; }
    public void setDirector(String director) { this.director = director; }

    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }

    public int getYear() { return year; }
    public void setYear(int year) { this.year = year; }

    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }
}
