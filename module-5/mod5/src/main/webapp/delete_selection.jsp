<%--
Jessica Long-Heinicke CSD 430
Created: 7.13.25
Updated:
--%>
<%@ page import="beans.MovieBean" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  // Check for success/error messages
  String message = null;
  String messageType = null;
  if (request.getParameter("success") != null) {
    message = "Movie deleted successfully!";
    messageType = "success";
  } else if (request.getParameter("error") != null) {
    message = "Error deleting movie: " + request.getParameter("error");
    messageType = "error";
  }

  // Get all movies
  List<MovieBean> movies = MovieBean.getAllMovies();
%>
<!DOCTYPE html>
<html>
<head>
  <title>Delete Movie Record</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 20px;
      background-color: #f8f9fa;
      color: #333;
    }
    .container {
      max-width: 1200px;
      margin: 0 auto;
      background: white;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 0 20px rgba(0,0,0,0.1);
    }
    h1 {
      color: #2c3e50;
      border-bottom: 2px solid #3498db;
      padding-bottom: 15px;
      margin-top: 0;
    }
    .message {
      padding: 15px;
      margin-bottom: 25px;
      border-radius: 4px;
      font-size: 16px;
    }
    .success {
      background-color: #d4edda;
      color: #155724;
      border-left: 4px solid #28a745;
    }
    .error {
      background-color: #f8d7da;
      color: #721c24;
      border-left: 4px solid #dc3545;
    }
    .info-box {
      background-color: #e8f4fd;
      border-left: 4px solid #3498db;
      padding: 20px;
      margin-bottom: 30px;
      border-radius: 4px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin: 25px 0;
      box-shadow: 0 0 10px rgba(0,0,0,0.05);
      font-size: 14px;
    }
    th, td {
      padding: 14px 16px;
      text-align: left;
      border-bottom: 1px solid #e1e4e8;
    }
    th {
      background-color: #3498db;
      color: white;
      font-weight: 600;
      letter-spacing: 0.5px;
    }
    tr:nth-child(even) { background-color: #f8fafc; }
    tr:hover { background-color: #f1f8ff; }
    .form-container {
      background: #f8fafc;
      padding: 25px;
      border-radius: 8px;
      margin: 30px 0;
      border: 1px solid #e1e4e8;
    }
    .form-group { margin-bottom: 22px; }
    label {
      display: block;
      margin-bottom: 10px;
      font-weight: 600;
      color: #2c3e50;
      font-size: 15px;
    }
    select {
      width: 100%;
      padding: 12px 15px;
      border: 1px solid #ced4da;
      border-radius: 4px;
      background-color: white;
      font-size: 15px;
      color: #495057;
      transition: border-color 0.15s;
    }
    select:focus {
      border-color: #3498db;
      outline: 0;
      box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
    }
    button {
      background: #e74c3c;
      color: white;
      border: none;
      cursor: pointer;
      padding: 13px 25px;
      font-size: 16px;
      font-weight: 600;
      border-radius: 4px;
      transition: background 0.2s;
      display: inline-flex;
      align-items: center;
      gap: 8px;
    }
    button:hover {
      background: #c0392b;
      box-shadow: 0 2px 8px rgba(231, 76, 60, 0.3);
    }
    .back-btn {
      display: inline-flex;
      align-items: center;
      padding: 10px 18px;
      background: #3498db;
      color: white;
      text-decoration: none;
      margin-bottom: 25px;
      border-radius: 4px;
      font-weight: 500;
      transition: background 0.2s;
      gap: 5px;
    }
    .back-btn:hover {
      background: #2980b9;
      text-decoration: none;
    }
    .data-description {
      background: #f8f9fa;
      border-radius: 8px;
      padding: 22px;
      margin-top: 30px;
      border: 1px solid #e9ecef;
    }
    .empty-state {
      text-align: center;
      padding: 40px;
      border: 2px dashed #e1e4e8;
      border-radius: 8px;
      margin: 30px 0;
      background: #f8fafc;
    }
    .empty-state h3 {
      color: #6c757d;
      margin-top: 0;
    }
    .empty-state p {
      color: #6c757d;
      max-width: 600px;
      margin: 10px auto;
      line-height: 1.6;
    }
    .empty-state a {
      color: #3498db;
      text-decoration: none;
      font-weight: 500;
    }
    .empty-state a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<div class="container">
  <a href="index.jsp" class="back-btn">
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
      <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
    </svg>
    Back to Home
  </a>
  <h1>Delete Movie Record</h1>

  <%-- Display messages --%>
  <% if (message != null) { %>
  <div class="message <%= messageType %>">
    <strong><%= messageType.equals("success") ? "✓ Success!" : "✗ Error!" %></strong>
    <%= message %>
  </div>
  <% } %>

  <div class="info-box">
    <h3>About This Functionality</h3>
    <p>This page allows you to permanently delete movie records from the database. Follow these steps:</p>
    <ol>
      <li><strong>Select a movie</strong> from the dropdown menu below</li>
      <li><strong>Confirm deletion</strong> when prompted</li>
      <li>The system will <strong>remove the record</strong> and display the updated list</li>
      <li>You can <strong>continue deleting</strong> records until none remain</li>
    </ol>
    <p style="margin-top: 15px; font-weight: 500;">
      Total movies in database: <span style="color: #3498db; font-weight: 600;"><%= movies.size() %></span>
    </p>
  </div>

  <% if (movies.isEmpty()) { %>
  <div class="empty-state">
    <h3>No Movies Found in Database</h3>
    <p>The movie database is currently empty. There are no records to delete.</p>
    <p>You can add new movies using the <a href="create.jsp">Add New Movie</a> page.</p>
  </div>
  <% } else { %>
  <h2>Current Movies in Database</h2>
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
      <td><strong><%= movie.getTitle() %></strong></td>
      <td><%= movie.getDirector() %></td>
      <td><%= movie.getReleaseYear() %></td>
      <td><span style="background: #e8f4fd; padding: 4px 8px; border-radius: 12px;"><%= movie.getGenre() %></span></td>
      <td>
        <div style="display: flex; align-items: center; gap: 8px;">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#f39c12" viewBox="0 0 16 16">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
          </svg>
          <%= String.format("%.1f", movie.getRating()) %>/10
        </div>
      </td>
    </tr>
    <% } %>
    </tbody>
  </table>

  <div class="form-container">
    <h2>Delete a Movie</h2>
    <form action="delete_processor.jsp" method="POST" onsubmit="return confirm('Are you sure you want to permanently delete this movie?');">
      <div class="form-group">
        <label for="movieId">Select Movie to Delete:</label>
        <select id="movieId" name="movieId" required>
          <option value="">-- Select a Movie --</option>
          <% for (MovieBean movie : movies) { %>
          <option value="<%= movie.getMovieId() %>">
            ID <%= movie.getMovieId() %>: <%= movie.getTitle() %> (<%= movie.getReleaseYear() %>)
          </option>
          <% } %>
        </select>
      </div>

      <button type="submit">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
          <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
          <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
        </svg>
        Delete Movie
      </button>
    </form>
  </div>
  <% } %>

  <div class="data-description">
    <h3>Database Information</h3>
    <p>This database contains detailed information about movies with the following fields:</p>
    <table style="width: 100%; margin: 15px 0; box-shadow: none;">
      <tr>
        <th style="background: #e9ecef; color: #495057;">Field</th>
        <th style="background: #e9ecef; color: #495057;">Description</th>
      </tr>
      <tr>
        <td><strong>Movie ID</strong></td>
        <td>Unique identifier (primary key)</td>
      </tr>
      <tr>
        <td><strong>Title</strong></td>
        <td>Official name of the film</td>
      </tr>
      <tr>
        <td><strong>Director</strong></td>
        <td>Primary director of the film</td>
      </tr>
      <tr>
        <td><strong>Release Year</strong></td>
        <td>Year the film was released</td>
      </tr>
      <tr>
        <td><strong>Genre</strong></td>
        <td>Primary genre classification</td>
      </tr>
      <tr>
        <td><strong>Rating</strong></td>
        <td>Average critic rating (0-10 scale)</td>
      </tr>
    </table>
    <p style="margin-top: 15px;">
      <strong>Table Name:</strong> jessica_movies_data |
      <strong>Database:</strong> CSD430 |
      <strong>User:</strong> student1@localhost
    </p>
  </div>
</div>
</body>
</html>