package hotelReservation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/linukaInsertServlet")
public class linukaInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			// 🟡 1. Form එකෙන් data ගන්න
			int user_id = Integer.parseInt(request.getParameter("user_id"));
			String checkinStr = request.getParameter("checkin");
			String checkoutStr = request.getParameter("checkout");
			int adults = Integer.parseInt(request.getParameter("adults"));
			int children = Integer.parseInt(request.getParameter("children"));
			String roomtype = request.getParameter("roomtype");
			
			// 🟡 2. Date type එකට convert කරන්න
			Date checkin = Date.valueOf(checkinStr);
			Date checkout = Date.valueOf(checkoutStr);
			
			// 🟡 3. Model එකට assign කරන්න
			linukaBookingModel booking = new linukaBookingModel(user_id, checkin, checkout, adults, children, roomtype);
			
			// 🟡 4. Database එකට insert කරන්න
			Connection con = DBConnection.getConnection();
			String sql = "INSERT INTO booking (user_id, checkin_date, checkout_date, adults, children, Room_type) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, booking.getUser_id());
			stmt.setDate(2, booking.getCheckin());
			stmt.setDate(3, booking.getCheckout());
			stmt.setInt(4, booking.getAdults());
			stmt.setInt(5, booking.getChildren());
			stmt.setString(6, booking.getRoomtype());
			
			int row = stmt.executeUpdate();
			
			// 🟡 5. Redirect or show message
			if (row > 0) {
				// ✅ user_id එක myBooking.jsp එකට parameter එකක් විදිහට යවන්න
				response.sendRedirect("myBooking.jsp?user_id=" + user_id);
			} else {
				response.sendRedirect("booking-fail.jsp");
			}
			
			stmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}
}
