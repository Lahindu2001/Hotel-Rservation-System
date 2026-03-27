package hotelReservation;

import java.sql.Date;	
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/dasuUpdateServlet")
public class dasuUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int userId = Integer.parseInt(request.getParameter("inquiryId"));
            String fullName = request.getParameter("fullName");
            String dateStr = request.getParameter("date");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String serviceType = request.getParameter("serviceType");
            String message = request.getParameter("message");

            // Convert date string to java.sql.Date
            Date date = Date.valueOf(dateStr);

            // Create model and set fields
            dasuInquiryModel inquiry = new dasuInquiryModel(userId, fullName, email, phone, date, serviceType, message);
            // Still needed due to constructor override

            // Call controller to update
            boolean success = dasuInquiryController.updateInquiry(inquiry);

            if (success) {
                response.setContentType("text/html");
                response.getWriter().println("<script type='text/javascript'>");
                response.getWriter().println("alert('Inquiry Updated Successfully! Wait for Admin Review. Thank You :)');");
                response.getWriter().println("window.location = 'dasuInquiryReadServlet?user_id=" + userId + "';");
                response.getWriter().println("</script>");
            }
            else {
                request.setAttribute("error", "Failed to update inquiry.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error updating inquiry.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
