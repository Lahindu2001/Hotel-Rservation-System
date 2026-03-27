package hotelReservation;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/viewAllGuests")
public class LViewAllGuestsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// Fetch all guest data from the database
		List<entryModel> allGuests = entryController.getAllguests();
		
		// Set the list as a request attribute
		request.setAttribute("allGuests", allGuests);
		
		// Forward to JSP page to display the guests
		RequestDispatcher dispatcher = request.getRequestDispatcher("allusers.jsp");
		dispatcher.forward(request, response);
	}
}
