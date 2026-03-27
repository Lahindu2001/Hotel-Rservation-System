package hotelReservation;

import java.sql.Date;
import java.sql.ResultSet;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

public class dasuInquiryController {

	private static boolean isSuccess;
	private static Connection con  = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//Insert  data to database
	public static boolean insertdata(int user_id,String fullname, String email, String phone, Date date, String serviceType,
			String message) {
		
		boolean isSuccess = false;
		
		try {
			//check databse connection
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			//sql query to insert value to databse
			
			String sql = "insert into cus_inquiry values ('"+user_id+"','"+fullname+"','"+email+"','"+phone+"','"+date+"','"+serviceType+"','"+message+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true ;
			}else {
				isSuccess = false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	
	//get by id function
	public static ArrayList<dasuInquiryModel> getById(String id) {
        int convertedID = Integer.parseInt(id);  // Convert string ID to integer

        ArrayList<dasuInquiryModel> inquiryList = new ArrayList<>();  // List to hold the inquiry details

        try {
            // Establish a connection with the database
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            // SQL query to fetch details from cus_inquiry table
            String sql = "SELECT * FROM cus_inquiry WHERE user_id = '" + convertedID + "'";

            // Execute the query
            rs = stmt.executeQuery(sql);

            // Loop through the result set
            while (rs.next()) {
                int user_id = rs.getInt(1);
                String fullname = rs.getString(2);
                String email = rs.getString(3);
                String phone = rs.getString(4);
                java.sql.Date date = rs.getDate(5);
                String serviceType = rs.getString(6);
                String message = rs.getString(7);

                // Create a new dasuInquiryModel object and add it to the list
                dasuInquiryModel inquiry = new dasuInquiryModel(user_id, fullname, email, phone, date, serviceType, message);
                inquiryList.add(inquiry);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return inquiryList;  // Return the list of inquiries
    }
	
	
	
	public static boolean updateInquiry(dasuInquiryModel inquiry) {
	    boolean isSuccess = false;
	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        conn = DBConnection.getConnection(); // Use your existing DB connection utility
	        String sql = "UPDATE cus_inquiry SET fullName = ?, email = ?, phone = ?, date = ?, serviceType = ?, message = ? WHERE user_id = ?";

	        pstmt = (PreparedStatement) conn.prepareStatement(sql);
	        pstmt.setString(1, inquiry.getFullName());
	        pstmt.setString(2, inquiry.getEmail());
	        pstmt.setString(3, inquiry.getPhone());
	        pstmt.setDate(4, inquiry.getDate());
	        pstmt.setString(5, inquiry.getServiceType());
	        pstmt.setString(6, inquiry.getMessage());
	        pstmt.setInt(7, inquiry.getUser_id());

	        int rowsAffected = pstmt.executeUpdate();
	        isSuccess = (rowsAffected > 0);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}


	
	
	public static boolean deleteInquiry(int userId) {
	    boolean isSuccess = false;
	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        conn = DBConnection.getConnection();
	        String sql = "DELETE FROM cus_inquiry WHERE user_id = ?";

	        pstmt = (PreparedStatement) conn.prepareStatement(sql);
	        pstmt.setInt(1, userId);

	        int rowsAffected = pstmt.executeUpdate();
	        isSuccess = (rowsAffected > 0);

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }

	    return isSuccess;
	}

	
	
	public static List<dasuInquiryModel> getAllInquiries() {
	    List<dasuInquiryModel> inquiryList = new ArrayList<>();

	    try {
	        // Establish DB connection
	        con = DBConnection.getConnection();
	        stmt = con.createStatement();

	        // SQL query to get all inquiries
	        String sql = "SELECT * FROM cus_inquiry";

	        // Execute query
	        rs = stmt.executeQuery(sql);

	        // Process result set
	        while (rs.next()) {
	            int user_id = rs.getInt("user_id");
	            String fullname = rs.getString("fullName");
	            String email = rs.getString("email");
	            String phone = rs.getString("phone");
	            Date date = rs.getDate("date");
	            String serviceType = rs.getString("serviceType");
	            String message = rs.getString("message");

	            dasuInquiryModel inquiry = new dasuInquiryModel(user_id, fullname, email, phone, date, serviceType, message);
	            inquiryList.add(inquiry);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return inquiryList;
	}


}
