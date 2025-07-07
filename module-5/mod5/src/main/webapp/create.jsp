<%--
  jessica long-heinicke 6.22.25 csd  430
  update 7.6.25
  create new entries
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="movieBean" class="beans.MovieBean" scope="request"/>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Movie</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .container { max-width: 600px; margin: 0 auto; }
        h1 { color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 8px; font-weight: bold; }
        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background: #3498db;
            color: white;
            border: none;
            padding: 12px 24px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover { background: #2980b9; }
        .back-link { display: inline-block; margin-top: 20px; }
    </style>
</head>
<body>
<div class="container">
    <h1>Add New Movie to Database</h1>
    <form action="create_processor.jsp" method="POST">
        <div class="form-group">
            <label for="title">Movie Title:</label>
            <input type="text" id="title" name="title" required>
        </div>

        <div class="form-group">
            <label for="director">Director:</label>
            <input type="text" id="director" name="director" required>
        </div>

        <div class="form-group">
            <label for="releaseYear">Release Year:</label>
            <input type="number" id="releaseYear" name="releaseYear" min="1900" max="2025" required>
        </div>

        <div class="form-group">
            <label for="genre">Genre:</label>
            <select id="genre" name="genre" required>
                <option value="">-- Select Genre --</option>
                <option value="Action">Action</option>
                <option value="Comedy">Comedy</option>
                <option value="Drama">Drama</option>
                <option value="Sci-Fi">Sci-Fi</option>
                <option value="Horror">Horror</option>
                <option value="Thriller">Thriller</option>
                <option value="Crime">Crime</option>
                <option value="Adventure">Adventure</option>
            </select>
        </div>

        <div class="form-group">
            <label for="rating">Rating (0-10):</label>
            <input type="number" id="rating" name="rating" step="0.1" min="0" max="10" required>
        </div>

        <button type="submit">Add Movie</button>
    </form>
    <a href="index.jsp" class="back-link">Back to Home</a>
</div>
</body>
</html>