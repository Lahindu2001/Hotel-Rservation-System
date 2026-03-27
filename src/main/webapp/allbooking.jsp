<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LuxStay - View Bookings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { margin: 0; font-family: 'Segoe UI', sans-serif; background-color: #f4f4f4; }
        .admin-container { display: flex; min-height: 100vh; }
        .sidebar { width: 220px; background-color: #2c3e50; color: white; flex-shrink: 0; display: flex; flex-direction: column; justify-content: space-between; }
        .sidebar .logo { padding: 20px; text-align: center; background-color: #1a252f; }
        .sidebar .logo h2 { margin: 0; font-size: 22px; }
        .sidebar .logo p { font-size: 12px; margin-top: 5px; color: #ccc; }
        .nav-menu ul { list-style: none; padding: 0; margin: 0; }
        .nav-menu ul li { border-bottom: 1px solid #1a252f; }
        .nav-menu ul li a { display: block; padding: 12px 20px; color: white; text-decoration: none; }
        .nav-menu ul li.active a, .nav-menu ul li a:hover { background-color: #1abc9c; }
        .logout { padding: 15px; text-align: center; border-top: 1px solid #1a252f; }
        .logout a { color: white; text-decoration: none; }
        .main-content { flex-grow: 1; background-color: #ecf0f1; display: flex; flex-direction: column; }
        .top-header { background-color: #fff; display: flex; justify-content: space-between; align-items: center; padding: 10px 25px; border-bottom: 1px solid #ddd; }
        .top-header input[type="text"] { padding: 6px; width: 200px; border: 1px solid #ccc; border-radius: 20px; padding-left: 25px; }
        .header-search { position: relative; }
        .header-search i { position: absolute; top: 9px; left: 10px; color: #888; }
        .header-actions i { font-size: 18px; margin-left: 20px; color: #555; cursor: pointer; }
        .content-container { padding: 30px; }
        table { border-collapse: collapse; width: 100%; background-color: white; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #555; text-align: center; }
        th { background-color: #2c3e50; color: white; }
        .delete-btn { background-color: #d9534f; color: white; padding: 6px 12px; border: none; cursor: pointer; border-radius: 4px; }
        .delete-btn:hover { background-color: #c9302c; }
        .update-btn { background-color: #5cb85c; color: white; padding: 6px 12px; border: none; cursor: pointer; border-radius: 4px; }
        .update-btn:hover { background-color: #4cae4c; }
        .add-btn { background-color: #3498db; color: white; padding: 8px 16px; border: none; cursor: pointer; border-radius: 4px; }
        .add-btn:hover { background-color: #2980b9; }
        input[type="text"], input[type="date"] { width: 100%; padding: 5px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
        select { width: 100%; padding: 5px; box-sizing: border-box; border-radius: 4px; }
        td form { margin: 0; display: inline; }

        /* Enhanced Form Design */
        .booking-form-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-left: 4px solid #3498db;
        }
        .booking-form-container h3 {
            margin-top: 0;
            color: #2c3e50;
            font-size: 24px;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }
        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 15px;
        }
        .form-row div {
            flex: 1;
        }
        .form-row label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #34495e;
        }
        .form-row input[type="text"],
        .form-row input[type="date"],
        .form-row select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: border-color 0.3s;
        }
        .form-row input[type="text"]:focus,
        .form-row input[type="date"]:focus,
        .form-row select:focus {
            border-color: #3498db;
            outline: none;
        }
        .booking-form-container button {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .booking-form-container button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<div class="admin-container">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="logo">
            <h2>LuxStay</h2>
            <p>Admin Portal</p>
        </div>
        <nav class="nav-menu">
            <ul>
                <li><a href="adminPannel.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li class="active"><a href="LviewallBokkingServlet"><i class="fas fa-calendar-check"></i> Manage Bookings</a></li>
                <li><a href="viewAllGuests"><i class="fas fa-users"></i> View Guests</a></li>
                <li><a href="LViewAllroomServlet"><i class="fas fa-door-open"></i> Room Management</a></li>
                <li><a href="LallInquiryviewServlet"><i class="fas fa-question-circle"></i> Manage Inquiries</a></li>
                <li><a href="LIncomeReportServlet"><i class="fas fa-chart-line"></i> Income Report</a></li>
            </ul>
        </nav>
        <div class="logout">
            <a href="#logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Top Header -->
        <header class="top-header">
            
        </header>

        <!-- Booking Content -->
        <div class="content-container">
            <h2>All Bookings</h2>

            <!-- Add New Booking Form -->
            <div class="booking-form-container">
                <h3>Add New Booking</h3>
                <form action="LahinduinsertBokkingServlet" method="post">
                    <div class="form-row">
                        <div>
                            <label for="user_id">User ID</label>
                            <input type="text" id="user_id" name="user_id" required />
                        </div>
                        <div>
                            <label for="checkin_date">Check-in Date</label>
                            <input type="date" id="checkin_date" name="checkin_date" required />
                        </div>
                        <div>
                            <label for="checkout_date">Check-out Date</label>
                            <input type="date" id="checkout_date" name="checkout_date" required />
                        </div>
                    </div>
                    <div class="form-row">
                        <div>
                            <label for="adults">Adults</label>
                            <select id="adults" name="adults" required>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                            </select>
                        </div>
                        <div>
                            <label for="children">Children</label>
                            <select id="children" name="children" required>
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                            </select>
                        </div>
                        <div>
                            <label for="room_type">Room Type</label>
                            <select id="room_type" name="room_type" required>
                                <option value="deluxe-king">Deluxe King Room</option>
                                <option value="premium-suite">Premium Suite</option>
                                <option value="family-room">Family Room</option>
                                <option value="executive-suite">Executive Suite</option>
                                <option value="connecting-rooms">Connecting Rooms</option>
                                <option value="honeymoon-suite">Honeymoon Suite</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="add-btn">Add Booking</button>
                </form>
            </div>

            <!-- Booking Table -->
            <table>
                <tr>
                    <th>User ID</th>
                    <th>Check-in</th>
                    <th>Check-out</th>
                    <th>Adults</th>
                    <th>Children</th>
                    <th>Room Type</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="booking" items="${allBookings}">
                    <tr>
                        <!-- Update Form -->
                        <form method="post" action="LupdatebookingServlet">
                            <td><input type="text" name="user_id" value="${booking.user_id}" readonly /></td>
                            <td><input type="date" name="checkin" value="${booking.checkin}" /></td>
                            <td><input type="date" name="checkout" value="${booking.checkout}" /></td>
                            <td><input type="text" name="adults" value="${booking.adults}" /></td>
                            <td><input type="text" name="children" value="${booking.children}" /></td>
                            <td>
                                <select name="roomtype">
                                    <option value="deluxe-king" ${booking.roomtype == 'deluxe-king' ? 'selected' : ''}>Deluxe King Room</option>
                                    <option value="premium-suite" ${booking.roomtype == 'premium-suite' ? 'selected' : ''}>Premium Suite</option>
                                    <option value="family-room" ${booking.roomtype == 'family-room' ? 'selected' : ''}>Family Room</option>
                                    <option value="executive-suite" ${booking.roomtype == 'executive-suite' ? 'selected' : ''}>Executive Suite</option>
                                    <option value="connecting-rooms" ${booking.roomtype == 'connecting-rooms' ? 'selected' : ''}>Connecting Rooms</option>
                                    <option value="honeymoon-suite" ${booking.roomtype == 'honeymoon-suite' ? 'selected' : ''}>Honeymoon Suite</option>
                                </select>
                            </td>
                            <td>
                                <button type="submit" class="update-btn">Update</button>
                        </form>
                        <form method="post" action="LdeletebookigServlet"
                              onsubmit="return confirm('Are you sure you want to delete this booking?');"
                              style="display:inline;">
                            <input type="hidden" name="user_id" value="${booking.user_id}" />
                            <button type="submit" class="delete-btn">Delete</button>
                        </form>
                            </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>