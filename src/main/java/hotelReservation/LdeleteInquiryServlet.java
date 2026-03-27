package hotelReservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LdeleteInquiryServlet
 */
@WebServlet("/LdeleteInquiryServlet")
public class LdeleteInquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int userId = Integer.parseInt(request.getParameter("user_id"));

            boolean success = dasuInquiryController.deleteInquiry(userId);

            if (success) {
                response.sendRedirect("LallInquiryviewServlet");
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
