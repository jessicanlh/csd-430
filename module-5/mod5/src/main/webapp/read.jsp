<%--
  jessica long-heinicke 6.22.25 csd  430
--%>
<<%@ page import="util.DBConnection" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Movies</title>
</head>
<body>
<h1>Movie List</h1>
<a href="index.jsp">Home</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Director</th>
        <th>Year</th>
        <th>Genre</th>
        <th>Rating</th>
    </tr>
    <%
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement()) {

            ResultSet rs = stmt.executeQuery("SELECT * FROM jessica_movies_data");

            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("movie_id") %></td>
        <td><%= rs.getString("title") %></td>
        <td><%= rs.getString("director") %></td>
        <td><%= rs.getInt("release_year") %></td>
        <td><%= rs.getString("genre") %></td>
        <td><%= rs.getDouble("rating") %></td>
    </tr>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>