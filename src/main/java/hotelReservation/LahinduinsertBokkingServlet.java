package hotelReservation;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LahinduinsertBokkingServlet
 */
@WebServlet("/LahinduinsertBokkingServlet")
public class LahinduinsertBokkingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        try {
	            // 1. Get form data
	            int userId = Integer.parseInt(request.getParameter("user_id"));
	            Date checkin = Date.valueOf(request.getParameter("checkin_date"));
	            Date checkout = Date.valueOf(request.getParameter("checkout_date"));
	            int adults = Integer.parseInt(request.getParameter("adults"));
	            int children = Integer.parseInt(request.getParameter("children"));
	            String roomType = request.getParameter("room_type");


	            // 3. Use controller to insert into database
	            boolean success = LaBookingController.insertBooking(userId, checkin, checkout, adults, children, roomType);

	            // 4. Redirect based on success or failure
	            if (success) {
	            	 response.getWriter().println("<script type='text/javascript'>");
	 	            response.getWriter().println("alert('booking Created Successfully!');");
	 	            response.getWriter().println("window.location.href = 'LviewallBokkingServlet';");  // Redirect to login after alert
	 	            response.getWriter().println("</script>");
	               
	            } else {
	                response.sendRedirect("bookingFail.jsp");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("error.jsp");
	        }
	    }


}
