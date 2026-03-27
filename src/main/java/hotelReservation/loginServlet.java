package hotelReservation;

import java.io.IOException;
import java.sql.*;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate login with DB using existing controller
        List<entryModel> user = entryController.loginValidate(email, password);

        if (!user.isEmpty()) {
            // User is valid, check their type from DB
            String userType = null;

            try (Connection con = DBConnection.getConnection()) {
                String sql = "SELECT type FROM guestdetails WHERE email = ?";
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setString(1, email);

                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    userType = rs.getString("type");
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

            HttpSession session = request.getSession();
            session.setAttribute("loggedUser", user.get(0));

            if ("admin".equalsIgnoreCase(userType)) {
                response.getWriter().println("<script>alert('Admin Login Successfully'); window.location='adminPannel.jsp';</script>");
            } else {
                response.getWriter().println("<script>alert('Login Successfully'); window.location='index.jsp';</script>");
            }

        } else {
            // Login failed
            request.setAttribute("errorMessage", "Invalid email or password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
