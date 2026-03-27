package hotelReservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LdeletebookigServlet
 */
@WebServlet("/LdeletebookigServlet")
public class LdeletebookigServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        try {
	            int bookingId = Integer.parseInt(request.getParameter("user_id"));

	            linukaBookingController controller = new linukaBookingController();
	            boolean isDeleted = controller.deleteBooking(bookingId);

	            if (isDeleted) {
	                // Show JS alert and redirect
	                response.setContentType("text/html");
	                response.getWriter().println("<script type='text/javascript'>");
	                response.getWriter().println("alert('Booking deleted successfully!');");
	                response.getWriter().println("window.location.href = 'LviewallBokkingServlet';");
	                response.getWriter().println("</script>");
	            } else {
	                response.sendRedirect("delete-fail.jsp");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("error.jsp");
	        }
	    }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
