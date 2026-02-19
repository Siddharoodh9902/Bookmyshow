package servlet;

import dao.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class SeatServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int movieId = Integer.parseInt(req.getParameter("id"));

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM seats WHERE movie_id=? ORDER BY seat_no ASC"
            );
            ps.setInt(1, movieId);

            ResultSet rs = ps.executeQuery();

            req.setAttribute("seats", rs);
            req.setAttribute("movie_id", movieId);

            RequestDispatcher rd = req.getRequestDispatcher("seat.jsp");
            rd.forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}






