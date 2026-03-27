package hotelReservation;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;

public class LaBookingController {

	
	 public static boolean insertBooking(int user_id, Date checkin, Date checkout, int adults, int children, String roomtype) {
	        try (Connection con = DBConnection.getConnection();
	             PreparedStatement pstmt = con.prepareStatement(
	                     "INSERT INTO booking (user_id, checkin_date, checkout_date, adults, children, room_type) VALUES (?, ?, ?, ?, ?, ?)")) {
	            pstmt.setInt(1,user_id);
	            pstmt.setDate(2, checkin);
	            pstmt.setDate(3, checkin);
	            pstmt.setInt(4, adults);
	            pstmt.setInt(5, children);
	            pstmt.setString(6, roomtype);
	            int result = pstmt.executeUpdate();
	            return result > 0;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	
	
	
	
}
