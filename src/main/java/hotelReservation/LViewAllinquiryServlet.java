package hotelReservation;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Servlet URL mapping
@WebServlet("/LViewAllinquiryServlet")
public class LViewAllinquiryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Retrieve all inquiries from the controller
            List<dasuInquiryModel> inquiries = dasuInquiryController.getAllInquiries();

            // Set the list as a request attribute to be used in JSP
            request.setAttribute("inquiryList", inquiries);

            // Forward the request to the JSP page
            request.getRequestDispatcher("viewAllGuestInquiry.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving inquiry data.");
        }
    }

    // Handle POST requests (optional — redirects to doGet)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
