package hotelReservation;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/dasuDeleteServlet")
public class dasuDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int userId = Integer.parseInt(request.getParameter("inquiryId"));

            boolean success = dasuInquiryController.deleteInquiry(userId);

            if (success) {
                response.sendRedirect("myInquiry.jsp");
            } else {
                request.setAttribute("error", "Failed to delete inquiry.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error deleting inquiry.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
