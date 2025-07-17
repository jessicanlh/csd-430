<%--
  jessica long-heinicke 6.22.25 csd  430
  update 6.29.25, 7.6.25
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Movie Database CRUD</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .container { max-width: 800px; margin: 0 auto; }
        h1 { color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
        ul { list-style: none; padding: 0; }
        li { margin: 15px 0; }
        a {
            display: block;
            padding: 12px;
            background: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s;
            font-weight: bold;
        }
        a:hover { background: #2980b9; }
    </style>
</head>
<body>
<div class="container">
    <h1>Movie Database CRUD Operations</h1>
    <ul>
        <li><a href="create.jsp">Add New Movie</a></li>
        <li><a href="read.jsp">View All Movies</a></li>
        <li><a href="update_selection.jsp">Update Movie Record</a></li> <!-- Updated link -->
        <li><a href="delete_selection.jsp">Delete Movie Record</a></li>
        <li><a href="select.jsp">View Movie by Selection</a></li>
    </ul>
</div>
</body>
</html>