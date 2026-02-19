

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Select Seats</title>
    <link rel="stylesheet" href="css/seats.css">
</head>
<body>

<h2>Select Your Seat</h2>

<div class="seats">
<%
    ResultSet seatRs = (ResultSet) request.getAttribute("seats");
    int movieId = (Integer) request.getAttribute("movie_id");

    while (seatRs.next()) {
        String seat = seatRs.getString("seat_no");
        boolean booked = seatRs.getInt("is_booked") == 1;
%>

    <form action="BookingServlet" method="post">
        <input type="hidden" name="seat_no" value="<%=seat%>">
        <input type="hidden" name="movie_id" value="<%=movieId%>">

        <button class="seat <%= booked ? "booked" : "" %>"
                <%= booked ? "disabled" : "" %>>
            <%=seat%>
        </button>
    </form>

<%
    } // while end
%>
</div>

</body>
</html>





