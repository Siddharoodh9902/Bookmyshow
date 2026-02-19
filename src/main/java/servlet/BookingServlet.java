package servlet;

import dao.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class BookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("user_id") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("user_id");
        int movieId = Integer.parseInt(req.getParameter("movie_id"));
        String seat = req.getParameter("seat_no");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO bookings(user_id, movie_id, seat_no) VALUES(?,?,?)"
            );
            ps.setInt(1, userId);
            ps.setInt(2, movieId);
            ps.setString(3, seat);
            ps.executeUpdate();

            PreparedStatement ps2 = con.prepareStatement(
                    "UPDATE seats SET is_booked=1 WHERE seat_no=? AND movie_id=?"
            );
            ps2.setString(1, seat);
            ps2.setInt(2, movieId);
            ps2.executeUpdate();

            res.sendRedirect("confirm.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
