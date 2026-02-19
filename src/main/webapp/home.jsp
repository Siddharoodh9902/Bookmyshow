<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Movies</title>
    <link rel="stylesheet" href="css/home.css">
</head>
<body>

<h1 class="title">Now Showing</h1>

<div class="movie-container">

<%
    ResultSet rs = (ResultSet) request.getAttribute("movies");

    if (rs != null) {
        while (rs.next()) {
%>

    <div class="movie-card">

        <!-- Movie Poster -->
<img src="images/<%= rs.getString("poster") %>"
             class="poster"
             alt="Movie Poster">

        <!-- Movie Title -->
        <h3><%= rs.getString("title") %></h3>

        <!-- Book Now Button -->
        <a class="btn" href="SeatServlet?id=<%= rs.getInt("id") %>">Book Now</a>



    </div>

<%
        } // end while
    } else {
%>

    <p>No movies found!</p>

<%
    }
%>

</div>

</body>
</html>
