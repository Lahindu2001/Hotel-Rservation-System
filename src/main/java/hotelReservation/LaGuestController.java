package hotelReservation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LaGuestController {

	public boolean addEntry(entryModel entry) {
		String query = "INSERT INTO guestdetails (fullname,email,phone,dob,country,gender,password) values (?,?,?,?,?,?,?)";
		try(Connection con = DBConnection.getConnection();
	             PreparedStatement stmt = con.prepareStatement(query)) {
			
			stmt.setString(1, entry.getFullname());
			stmt.setString(2, entry.getEmail());
			stmt.setString(3, entry.getPhone());
			stmt.setDate(4, entry.getDob());
			stmt.setString(5, entry.getCountry());
			stmt.setString(6, entry.getGender());
			stmt.setString(7, entry.getPassword());


			int rowsAffected = stmt.executeUpdate();
			return rowsAffected > 0;
			
		}	catch(SQLException e) {
            System.out.println("Error while inserting entry into the database.");
            e.printStackTrace();
            return false;
		}			
	}
	
	
	
	
	
}
