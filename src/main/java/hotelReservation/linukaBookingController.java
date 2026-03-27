package hotelReservation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class linukaBookingController {

    // Method to retrieve booking data using user_id
    public List<linukaBookingModel> getBookingsByUserId(int userId) {
        List<linukaBookingModel> bookings = new ArrayList<>();

        try {
            // Database එකට connection එක ගන්න
            Connection con = DBConnection.getConnection();
            
            // SQL query එක user_id අනුව bookings ලබා ගැනීම සඳහා
            String sql = "SELECT * FROM booking WHERE user_id = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, userId);  // user_id එක set කරන්න
            
            // Query එක execute කරලා ResultSet එක ලබා ගන්න
            ResultSet rs = stmt.executeQuery();
            
            // ResultSet එකෙන් data එක ගන්න
            while (rs.next()) {
                int user_id = rs.getInt("user_id");
                Date checkin = rs.getDate("checkin_date");
                Date checkout = rs.getDate("checkout_date");
                int adults = rs.getInt("adults");
                int children = rs.getInt("children");
                String roomtype = rs.getString("Room_type");
                
                // linukaBookingModel object එකක් create කරලා list එකට add කරන්න
                linukaBookingModel booking = new linukaBookingModel(user_id, checkin, checkout, adults, children, roomtype);
                bookings.add(booking);
            }
            
            // resources close කරන්න
            rs.close();
            stmt.close();
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return bookings;
    }
    
    
    
    
 // Method to delete a booking by booking_id
    public boolean deleteBooking(int bookingId) {
        boolean isDeleted = false;
        
        try {
            // Database connection
            Connection con = DBConnection.getConnection();
            
            // SQL query to delete a booking
            String sql = "DELETE FROM booking WHERE user_id = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, bookingId);  // Set the booking_id to delete
            
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                isDeleted = true;  // Booking deleted successfully
            }
            
            // Close resources
            stmt.close();
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return isDeleted;
    }
    

    public boolean updateBooking(linukaBookingModel updatedBooking) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Establish a connection to the database
            conn = DBConnection.getConnection();

            // SQL UPDATE statement to modify the booking details in the database
            String sql = "UPDATE booking SET checkin_date = ?, checkout_date = ?, adults = ?, children = ?, Room_type = ? WHERE user_id = ?";

            // Prepare the statement
            stmt = conn.prepareStatement(sql);

            // Set the parameters for the prepared statement
            stmt.setDate(1, updatedBooking.getCheckin()); // Set check-in date
            stmt.setDate(2, updatedBooking.getCheckout()); // Set check-out date
            stmt.setInt(3, updatedBooking.getAdults());   // Set number of adults
            stmt.setInt(4, updatedBooking.getChildren()); // Set number of children
            stmt.setString(5, updatedBooking.getRoomtype()); // Set the room type
            stmt.setInt(6, updatedBooking.getUser_id());  // Set the booking ID for the WHERE clause

            // Execute the update query
            int rowsUpdated = stmt.executeUpdate();

            // Return true if at least one row was updated, otherwise false
            return rowsUpdated > 0;
        } catch (SQLException e) {
            // Log the exception
            e.printStackTrace();
            return false;
        }
    }
    
    
    public static List<linukaBookingModel> getAllBookings() {
        List<linukaBookingModel> bookings = new ArrayList<>();
        
        String sql = "SELECT * FROM booking";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                int user_id = rs.getInt("user_id");
                Date checkin = rs.getDate("checkin_date");
                Date checkout = rs.getDate("checkout_date");
                int adults = rs.getInt("adults");
                int children = rs.getInt("children");
                String roomtype = rs.getString("Room_type");
                
                linukaBookingModel booking = new linukaBookingModel(user_id, checkin, checkout, adults, children, roomtype);
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return bookings;
    }
}
