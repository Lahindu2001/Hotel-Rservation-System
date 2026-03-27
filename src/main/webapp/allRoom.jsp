<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LuxStay - View Rooms</title>
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
        .update-btn { background-color: #5cb85c; color: white; padding: 6px 12px; border: none; cursor: pointer; border-radius: 4px; }
        .update-btn:hover { background-color: #4cae4c; }
        .delete-btn { background-color: #d9534f; color: white; padding: 6px 12px; border: none; cursor: pointer; border-radius: 4px; }
        .delete-btn:hover { background-color: #c9302c; }
        .add-btn { background-color: #3498db; color: white; padding: 8px 16px; border: none; cursor: pointer; border-radius: 4px; }
        .add-btn:hover { background-color: #2980b9; }
        input[type="text"], select { width: 100%; padding: 5px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
        td form { margin: 0; display: inline; }
        .add-room-form { background-color: white; padding: 20px; border-radius: 8px; margin-bottom: 20px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); }
        .add-room-form h3 { margin-top: 0; }
        .form-row { display: flex; gap: 20px; margin-bottom: 15px; }
        .form-row div { flex: 1; }
        .form-row label { display: block; margin-bottom: 5px; font-weight: bold; }
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
                <li><a href="LviewallBokkingServlet"><i class="fas fa-calendar-check"></i> Manage Bookings</a></li>
                <li><a href="viewAllGuests"><i class="fas fa-users"></i> View Guests</a></li>
                <li class="active"><a href="LViewAllroomServlet"><i class="fas fa-door-open"></i> Room Management</a></li>
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

        <!-- Room Management Content -->
        <div class="content-container">
            <h2>Room Management</h2>

            <!-- Add Room Form -->
            <div class="add-room-form">
                <h3>Add New Room Type</h3>
                <form method="post" action="LahinduInsertServlet">
                    <div class="form-row">
                        <div>
                            <label for="room_type">Room Type</label>
                            <input type="text" id="room_type" name="room_type" required />
                        </div>
                        <div>
                            <label for="per_day_price">Price Per Day</label>
                            <input type="text" id="per_day_price" name="per_day_price" required />
                        </div>
                        <div>
                            <label for="availability">Availability</label>
                            <select id="availability" name="availability" required>
                                <option value="true">Available</option>
                                <option value="false">Unavailable</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="add-btn">Add Room</button>
                </form>
            </div>

            <!-- Room Table -->
            <table>
                <tr>
                    <th>Type</th>
                    <th>Price (Per Day)</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="room" items="${roomList}">
                    <tr>
                        <form method="post" action="LahinduUpdateServlet">
                            <td><input type="text" name="room_type" value="${room.roomType}" readonly /></td>
                            <td><input type="text" name="per_day_price" value="${room.perDayPrice}" /></td>
                            <td>
                                <select name="availability">
                                    <option value="true" ${room.availability ? "selected" : ""}>Available</option>
                                    <option value="false" ${!room.availability ? "selected" : ""}>Unavailable</option>
                                </select>
                            </td>
                            <td>
                                <button type="submit" class="update-btn">Update</button>
                            </form>
                            <form method="post" action="LahinduDeleteServlet" style="display:inline;">
                                <input type="hidden" name="room_type" value="${room.roomType}" />
                                <button type="submit" class="delete-btn" onclick="return confirm('Are you sure you want to delete this room?');">Delete</button>
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