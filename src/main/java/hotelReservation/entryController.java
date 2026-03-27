package hotelReservation;

import java.sql.Connection;	
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import hotelReservation.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class entryController {
	
	//Add data into the hoteldatabse - Hasaranga
	
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
		

	// Get all guests - Hasaranga
	
	public static List<entryModel> getAllguests(){
		ArrayList<entryModel> entries = new ArrayList<>();
		
		String sql = "SELECT * FROM guestdetails";
		try(Connection con = DBConnection.getConnection();
				PreparedStatement stmt = con.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery()) {
			
			while(rs.next()) {
				int id = rs.getInt("guestid");
	            String fullname = rs.getString("fullname");
	            String email = rs.getString("email");
	            String phone = rs.getString("phone");
	            java.sql.Date dob = rs.getDate("dob");
	            String country = rs.getString("country");
	            String gender = rs.getString("gender");
	            String password = rs.getString("password");
	            
	            entryModel entry = new entryModel(id, fullname, email, phone, dob, country, gender, password);
	            entries.add(entry);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return entries;
	}

	
	//update the guest details
	public static boolean updateData(int id, String fullname, String email, String phone, java.sql.Date dob, String country, String gender, String password) {
	    String sql = "UPDATE guestdetails SET fullname = ?, email = ?, phone = ?, dob = ?, country = ?, gender = ?, password = ? WHERE guestid = ?";
	    
	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement stmt = con.prepareStatement(sql)) {

	        stmt.setString(1, fullname);
	        stmt.setString(2, email);
	        stmt.setString(3, phone);
	        stmt.setDate(4, dob);
	        stmt.setString(5, country);
	        stmt.setString(6, gender);
	        stmt.setString(7, password);
	        stmt.setInt(8, id);  // ID comes at the end

	        int rowsAffected = stmt.executeUpdate();
	        return rowsAffected > 0;

	    } catch (SQLException e) {
	        System.out.println("Error while updating entry in the database.");
	        e.printStackTrace();
	        return false;
	    }
	}
	
	
	
//create delete function
    
    public static boolean deletedata(int ID) {
        try {
        	// Get the database connection
            Connection con = DBConnection.getConnection();
            
            // Prepare SQL query to delete a user by ID
            String sql = "DELETE FROM guestdetails WHERE guestid = " + ID;
            
            // Create Statement to execute the query
            Statement stmt = con.createStatement();
            
            // Execute the delete query
            int rowsAffected = stmt.executeUpdate(sql);
            
            // Return true if the query deleted at least one row
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Return false in case of error
        }
    }
	
    
 
    
   // Login validate part - Hasaranga
    
    public static List<entryModel> loginValidate(String email, String password) {
        List<entryModel> userList = new ArrayList<>();

        String sql = "SELECT * FROM guestdetails WHERE email = ? AND password = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("guestid");
                String fullname = rs.getString("fullname");
                String gmail = rs.getString("email");
                String phone = rs.getString("phone");
                java.sql.Date dob = rs.getDate("dob");
                String country = rs.getString("country");
                String gender = rs.getString("gender");
                String pass = rs.getString("password");

                entryModel user = new entryModel(id, fullname, gmail, phone, dob, country, gender, pass);
                userList.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;
    }


 // Select user profile by ID
    public static List<entryModel> userProfile(int id) {
        List<entryModel> userList = new ArrayList<>();

        String sql = "SELECT * FROM guestdetails WHERE guestid = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, id); // id set කරනවා

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int userId = rs.getInt("guestid");
                String fullname = rs.getString("fullname");
                String gmail = rs.getString("email");
                String phone = rs.getString("phone");
                java.sql.Date dob = rs.getDate("dob");
                String country = rs.getString("country");
                String gender = rs.getString("gender");
                String pass = rs.getString("password");

                entryModel user = new entryModel(userId, fullname, gmail, phone, dob, country, gender, pass);
                userList.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;
    }


    
    
    
    
    
    
    
    
    
    
    
    
  

}

