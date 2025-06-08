<%-- Jessica Long-Heinicke Module 3 CSD 430 6.8.25 --%>
<%-- Creates a feedback form for a restuarant --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Experience Feedback Form</title>
</head>
<body>
<h2>Customer Feedback Form</h2>
<p>Please fill out your dining experience details below:</p>

<form action="feedbackResult.jsp" method="post">
    <%-- name input --%>
    <label for="name">Your Name:</label><br>
    <input type="text" id="name" name="name" required><br><br>

    <%-- email input --%>
    <label for="email">Email Address:</label><br>
    <input type="email" id="email" name="email" required><br><br>

    <%-- rating input for meal --%>
    <label>How would you rate your meal?</label><br>
    <input type="radio" name="mealRating" value="Excellent"> Excellent<br>
    <input type="radio" name="mealRating" value="Good"> Good<br>
    <input type="radio" name="mealRating" value="Fair"> Fair<br>
    <input type="radio" name="mealRating" value="Poor"> Poor<br><br>

    <%-- rating input for service --%>
    <label for="service">Service Satisfaction:</label><br>
    <select name="service" id="service">
        <option value="Outstanding">Outstanding</option>
        <option value="Satisfactory">Satisfactory</option>
        <option value="Needs Improvement">Needs Improvement</option>
    </select><br><br>

    <%-- additional comments --%>
    <label for="comments">Additional Comments:</label><br>
    <textarea name="comments" id="comments" rows="4" cols="40"></textarea><br><br>

    <input type="submit" value="Submit Feedback">
</form>
</body>
</html>
