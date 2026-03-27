package hotelReservation;

import hotelReservation.linukaBookingController;
import hotelReservation.linukaBookingModel;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/linukaUpdateServlet")
public class linukaUpdateServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        int userId = Integer.parseInt(request.getParameter("user_id"));
	        Date checkinDate = Date.valueOf(request.getParameter("checkin"));
	        Date checkoutDate = Date.valueOf(request.getParameter("checkout"));
	        int adults = Integer.parseInt(request.getParameter("adults"));
	        int children = Integer.parseInt(request.getParameter("children"));
	        String roomType = request.getParameter("roomtype");

	        linukaBookingModel updatedBooking = new linukaBookingModel(userId, checkinDate, checkoutDate, adults, children, roomType);
	        linukaBookingController controller = new linukaBookingController();
	        boolean updateSuccess = controller.updateBooking(updatedBooking);

	        if (updateSuccess) {
	            // Set content type to HTML
	            response.setContentType("text/html");
	            response.getWriter().println("<script type='text/javascript'>");
	            response.getWriter().println("alert('Booking updated successfully!');");
	            response.getWriter().println("window.location.href = 'myBooking.jsp?user_id=" + userId + "';");
	            response.getWriter().println("</script>");
	        } else {
	            response.sendRedirect("error.jsp");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.sendRedirect("error.jsp");
	    }
	}

}
