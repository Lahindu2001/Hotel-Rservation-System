package hotelReservation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

public class LahinduController {

    // Method to insert a new room type
    public static boolean insertRoomType(String room_type, double per_day_price, boolean availability) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(
                     "INSERT INTO room_type (room_type, per_day_price, availability) VALUES (?, ?, ?)")) {
            pstmt.setString(1, room_type);
            pstmt.setDouble(2, per_day_price);
            pstmt.setBoolean(3, availability);
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to get all room types
    public static List<LahinduModel> getAllRooms() {
        List<LahinduModel> roomList = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM room_type")) {
            while (rs.next()) {
                String room_type = rs.getString("room_type");
                double per_day_price = rs.getDouble("per_day_price");
                boolean availability = rs.getBoolean("availability");
                LahinduModel room = new LahinduModel(room_type, per_day_price, availability);
                roomList.add(room);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to retrieve rooms: " + e.getMessage(), e);
        }
        return roomList;
    }

    // Method to update an existing room type
    public static boolean updateRoom(LahinduModel room) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(
                     "UPDATE room_type SET per_day_price = ?, availability = ? WHERE room_type = ?")) {
            pstmt.setDouble(1, room.getPerDayPrice());
            pstmt.setBoolean(2, room.isAvailability());
            pstmt.setString(3, room.getRoomType());
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to delete a room type by room_type
    public static boolean deleteRoom(String room_type) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement("DELETE FROM room_type WHERE room_type = ?")) {
            pstmt.setString(1, room_type);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}