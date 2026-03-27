<%@ page import="hotelReservation.linukaBookingController" %>
<%@ page import="hotelReservation.linukaBookingModel" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Check if the user is logged in
    Object loggedUser = session.getAttribute("loggedUser");
    
    // If there's no logged user, redirect to login page
    if (loggedUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    String userIdStr = request.getParameter("user_id");
    int userId = Integer.parseInt(userIdStr);

    linukaBookingController controller = new linukaBookingController();
    List<linukaBookingModel> bookings = controller.getBookingsByUserId(userId);
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="CSSFiles/style.css">
    <link rel="stylesheet" href="CSSFiles/linukaBookings.css">
    <title>LuxStay Hotel - Booking Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <%@ include file = "header.jsp" %>

    <div id="booking-system-container">
        <a href="index.jsp" id="booking-back-btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        <h2 id="booking-title">Your Booking Details</h2>

        <!-- Banner to encourage more bookings -->
        <div class="booking-promo-banner">
            <span class="special-offer-tag">Special Offer</span>
            <div class="promo-content">
                <h3>Enhance Your Stay at LuxStay Hotel</h3>
                <p>Enjoy exclusive benefits by booking additional rooms for your friends and family. Get 15% off when you book 2 or more rooms!</p>
            </div>
        </div>

        <%
        if (bookings.isEmpty()) {
        %>
        <p id="no-bookings-message">
            <i class="fas fa-info-circle fa-lg" style="margin-right: 10px;"></i>
            You don't have any active bookings. Start by booking your perfect room for an unforgettable stay.
        </p>
        <%
        } else {
        %>
        <table id="bookings-table">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Check-in</th>
                    <th>Check-out</th>
                    <th>Adults</th>
                    <th>Children</th>
                    <th>Room Type</th>
                    
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <%
            for (linukaBookingModel b : bookings) {
                String roomClass = "";
                String selectedRoomType = b.getRoomtype();
                if (selectedRoomType.toLowerCase().contains("standard")) {
                    roomClass = "booking-room-standard";
                } else if (selectedRoomType.toLowerCase().contains("deluxe")) {
                    roomClass = "booking-room-deluxe";
                } else {
                    roomClass = "booking-room-suite";
                }
            %>
            <tr>
                <form action="linukaUpdateServlet" method="post">
                    <input type="hidden" name="booking_id" value="<%= b.getUser_id() %>">
                    <input type="hidden" name="user_id" value="<%= b.getUser_id() %>">
                    <td data-label="Booking ID"><%= b.getUser_id() %></td>

                    <td data-label="Check-in">
                        <input type="date" name="checkin" value="<%= b.getCheckin() %>">
                    </td>

                    <td data-label="Check-out">
                        <input type="date" name="checkout" value="<%= b.getCheckout() %>">
                    </td>

                    <td data-label="Adults">
                        <select id="adults" name="adults">
                            <option value="1" <%= b.getAdults() == 1 ? "selected" : "" %>>1</option>
                            <option value="2" <%= b.getAdults() == 2 ? "selected" : "" %>>2</option>
                            <option value="3" <%= b.getAdults() == 3 ? "selected" : "" %>>3</option>
                            <option value="4" <%= b.getAdults() == 4 ? "selected" : "" %>>4</option>
                        </select>
                    </td>

                    <td data-label="Children">
                        <select id="children" name="children">
                            <option value="0" <%= b.getChildren() == 0 ? "selected" : "" %>>0</option>
                            <option value="1" <%= b.getChildren() == 1 ? "selected" : "" %>>1</option>
                            <option value="2" <%= b.getChildren() == 2 ? "selected" : "" %>>2</option>
                            <option value="3" <%= b.getChildren() == 3 ? "selected" : "" %>>3</option>
                        </select>
                    </td>

                    <td data-label="Room Type" class="<%= roomClass %>">
                        <select id="room-type" name="roomtype">
                            <option value="deluxe-king" <%= selectedRoomType.equals("deluxe-king") ? "selected" : "" %>>Deluxe King Room</option>
                            <option value="premium-suite" <%= selectedRoomType.equals("premium-suite") ? "selected" : "" %>>Premium Suite</option>
                            <option value="family-room" <%= selectedRoomType.equals("family-room") ? "selected" : "" %>>Family Room</option>
                            <option value="executive-suite" <%= selectedRoomType.equals("executive-suite") ? "selected" : "" %>>Executive Suite</option>
                            <option value="connecting-rooms" <%= selectedRoomType.equals("connecting-rooms") ? "selected" : "" %>>Connecting Rooms</option>
                            <option value="honeymoon-suite" <%= selectedRoomType.equals("honeymoon-suite") ? "selected" : "" %>>Honeymoon Suite</option>
                        </select>
                    </td>

                    <td data-label="Actions">
                        <!-- Updated form action for update -->
                        <button type="submit" name="action" value="update" class="btn-update">
                            <i class="fas fa-save"></i> Update My Booking
                        </button>
                    </td>
                    
                    
                </form>

                <!-- Separate form for delete action -->
                <form action="linukaDeleteServlet" method="Post" style="display:inline;">
                    <input type="text" name="user_id" value="${loggedUser.id}" style="display:none;">
                    <button type="submit" name="action" value="cancel" class="btn-cancel" onclick="return confirm('Are you sure you want to cancel this booking?');">
                        <i class="fas fa-times"></i> Cancel My Booking
                    </button>
                </form>
            </tr>
            <%
            }
            %>
            </tbody>
        </table>
        <%
        }
        %>
    </div>

    <%@ include file = "footer.jsp" %>
    
    <script>
        // Add minimal JavaScript for date validation
        document.addEventListener('DOMContentLoaded', function() {
            const forms = document.querySelectorAll('form');
            
            forms.forEach(form => {
                form.addEventListener('submit', function(e) {
                    const checkin = new Date(this.querySelector('input[name="checkin"]').value);
                    const checkout = new Date(this.querySelector('input[name="checkout"]').value);
                    
                    if (checkout <= checkin) {
                        e.preventDefault();
                        alert('Check-out date must be after check-in date');
                    }
                });
            });
        });
    </script>
</body>
</html>
