package hotelReservation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LIncomeReportServlet")
public class LIncomeReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<IncomeReportModel> incomeReport = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(
                     "SELECT rt.room_type, rt.per_day_price, b.checkin_date, b.checkout_date " +
                     "FROM room_type rt " +
                     "JOIN booking b ON rt.room_type = b.room_type")) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String roomType = rs.getString("room_type");
                double perDayPrice = rs.getDouble("per_day_price");
                java.sql.Date checkinDate = rs.getDate("checkin_date");
                java.sql.Date checkoutDate = rs.getDate("checkout_date");

                // Calculate days difference, ensuring at least 1 day if check-in and check-out are the same
                long diffInMillies = checkoutDate.getTime() - checkinDate.getTime();
                long days = diffInMillies / (1000 * 60 * 60 * 24);
                days = Math.max(1, days); // Ensure at least 1 day if dates are the same

                double incomePrice = perDayPrice * days;

                // Debug: Log each record
                System.out.println("Room Type: " + roomType + ", Price/Day: " + perDayPrice +
                        ", Check-in: " + checkinDate + ", Check-out: " + checkoutDate +
                        ", Days: " + days + ", Income: " + incomePrice);

                incomeReport.add(new IncomeReportModel(roomType, perDayPrice, checkinDate, checkoutDate, incomePrice));
            }
            // Debug: Log the size of the list
            System.out.println("Total records fetched: " + incomeReport.size());
            request.setAttribute("incomeReport", incomeReport);
            request.getRequestDispatcher("incomeReport.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating income report: " + e.getMessage());
        }
    }
}