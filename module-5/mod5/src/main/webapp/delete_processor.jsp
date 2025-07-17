<%--
jessica long-heinicke csd 430
Created: 7.6.25
Updated: 7.13.25
--%>
<%@ page import="beans.MovieBean" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  // Get movie ID to delete
  int movieId = 0;
  String error = null;
  String title = "";

  try {
    // Get movie ID from request
    movieId = Integer.parseInt(request.getParameter("movieId"));

    // Get movie details before deletion
    MovieBean movie = MovieBean.getMovieById(movieId);
    if (movie.getTitle() == null || movie.getTitle().isEmpty()) {
      error = "Movie not found with ID: " + movieId;
    } else {
      title = movie.getTitle();

      // Attempt deletion
      boolean success = MovieBean.delete(movieId);
      if (!success) {
        error = "Database error occurred while deleting movie";
      }
    }
  } catch (NumberFormatException e) {
    error = "Invalid movie ID format: " + request.getParameter("movieId");
  } catch (Exception e) {
    error = "Unexpected error: " + e.getMessage();
  }

  // Prepare redirect parameters
  String redirectParams = "";
  if (error == null) {
    redirectParams = "?success=true";
  } else {
    // Encode error message for URL
    redirectParams = "?error=" + URLEncoder.encode(error, "UTF-8");
  }

  // Redirect back to selection page
  response.sendRedirect("delete_selection.jsp" + redirectParams);
%>