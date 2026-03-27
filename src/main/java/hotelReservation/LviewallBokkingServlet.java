package hotelReservation;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class LviewallBokkingServlet
 */
@WebServlet("/LviewallBokkingServlet")
public class LviewallBokkingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch all booking data from the database
        List<linukaBookingModel> allBookings = linukaBookingController.getAllBookings();

        // Set the list as a request attribute
        request.setAttribute("allBookings", allBookings);

        // Forward to JSP page to display the bookings
        RequestDispatcher dispatcher = request.getRequestDispatcher("allbooking.jsp");
        dispatcher.forward(request, response);
    }
	
	
	
	

}
