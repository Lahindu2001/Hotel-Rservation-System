package hotelReservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LallInquiryviewServlet
 */
@WebServlet("/LallInquiryviewServlet")
public class LallInquiryviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch all booking data from the database
        List<dasuInquiryModel> allInquiry = dasuInquiryController.getAllInquiries();

        // Set the list as a request attribute
        request.setAttribute("allInquiry", allInquiry);

        // Forward to JSP page to display the bookings
        RequestDispatcher dispatcher = request.getRequestDispatcher("allinquiry.jsp");
        dispatcher.forward(request, response);
    }
	
	
	
	
	
	
	
	
	
	
	
	

}
