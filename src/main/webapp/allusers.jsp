<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LuxStay - View Guests</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f4;
        }

        .admin-container {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 220px;
            background-color: #2c3e50;
            color: white;
            flex-shrink: 0;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .sidebar .logo {
            padding: 20px;
            text-align: center;
            background-color: #1a252f;
        }

        .sidebar .logo h2 {
            margin: 0;
            font-size: 22px;
        }

        .sidebar .logo p {
            font-size: 12px;
            margin-top: 5px;
            color: #ccc;
        }

        .nav-menu ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .nav-menu ul li {
            border-bottom: 1px solid #1a252f;
        }

        .nav-menu ul li a {
            display: block;
            padding: 12px 20px;
            color: white;
            text-decoration: none;
        }

        .nav-menu ul li.active a,
        .nav-menu ul li a:hover {
            background-color: #1abc9c;
        }

        .logout {
            padding: 15px;
            text-align: center;
            border-top: 1px solid #1a252f;
        }

        .logout a {
            color: white;
            text-decoration: none;
        }

        .main-content {
            flex-grow: 1;
            background-color: #ecf0f1;
            display: flex;
            flex-direction: column;
        }

        .top-header {
            background-color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 25px;
            border-bottom: 1px solid #ddd;
        }

        .top-header input[type="text"] {
            padding: 6px;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 20px;
            padding-left: 25px;
        }

        .header-search {
            position: relative;
        }

        .header-search i {
            position: absolute;
            top: 9px;
            left: 10px;
            color: #888;
        }

        .header-actions i {
            font-size: 18px;
            margin-left: 20px;
            color: #555;
            cursor: pointer;
        }

        .content-container {
            padding: 30px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            background-color: white;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #555;
            text-align: center;
        }

        th {
            background-color: #2c3e50;
            color: white;
        }

        .delete-btn {
            background-color: #d9534f;
            color: white;
            padding: 6px 12px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        .delete-btn:hover {
            background-color: #c9302c;
        }

        .update-btn {
            background-color: #5cb85c;
            color: white;
            padding: 6px 12px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        .update-btn:hover {
            background-color: #4cae4c;
        }

        input[type="text"], input[type="email"], input[type="tel"], input[type="date"], input[type="password"] {
            width: 100%;
            padding: 5px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        select {
            width: 100%;
            padding: 5px;
            box-sizing: border-box;
            border-radius: 4px;
        }

        td form {
            margin: 0;
            display: inline;
        }

        /* Enhanced Form Design */
        .guest-form-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-left: 4px solid #1abc9c;
        }

        .guest-form-container h3 {
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
        .form-row input[type="email"],
        .form-row input[type="tel"],
        .form-row input[type="date"],
        .form-row input[type="password"],
        .form-row select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: border-color 0.3s;
        }

        .form-row input[type="text"]:focus,
        .form-row input[type="email"]:focus,
        .form-row input[type="tel"]:focus,
        .form-row input[type="date"]:focus,
        .form-row input[type="password"]:focus,
        .form-row select:focus {
            border-color: #1abc9c;
            outline: none;
        }

        .guest-form-container button {
            background-color: #1abc9c;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .guest-form-container button:hover {
            background-color: #16a085;
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
                <li><a href="LviewallBokkingServlet"><i class="fas fa-calendar-check"></i> Manage Bookings</a></li>
                <li class="active"><a href="viewAllGuests"><i class="fas fa-users"></i> View Guests</a></li>
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

        <!-- Guest Content -->
        <div class="content-container">
            <h2>All Registered Guests</h2>

            <!-- Add New Guest Form -->
            <div class="guest-form-container">
                <h3>Add New Guest</h3>
                <form action="lahinduGuestinsertServlet" method="POST">
                    <div class="form-row">
                        <div>
                            <label for="fullname">Full Name:</label>
                            <input type="text" id="fullname" name="fullname" required>
                        </div>
                        <div>
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div>
                            <label for="phone">Phone Number:</label>
                            <input type="tel" id="phone" name="phone" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div>
                            <label for="dob">Date of Birth:</label>
                            <input type="date" id="dob" name="dob" required>
                        </div>
                        <div>
                            <label for="country">Country/Region:</label>
                            <input type="text" id="country" name="country" required>
                        </div>
                        <div>
                            <label for="gender">Gender:</label>
                            <select id="gender" name="gender" required>
                                <option value="">Select Gender</option>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div>
                            <label for="password">Password:</label>
                            <input type="password" id="password" name="password" required>
                        </div>
                    </div>
                    <button type="submit">Add Guest</button>
                </form>
            </div>

            <!-- Guest Table -->
            <table>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>DOB</th>
                    <th>Country</th>
                    <th>Gender</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="guest" items="${allGuests}">
                    <tr>
                        <!-- Update Form -->
                        <form method="post" action="LupdateServlet">
                            <td><input type="text" name="id" value="${guest.id}" readonly /></td>
                            <td><input type="text" name="fullname" value="${guest.fullname}" /></td>
                            <td><input type="email" name="email" value="${guest.email}" /></td>
                            <td><input type="text" name="phone" value="${guest.phone}" /></td>
                            <td><input type="date" name="dob" value="${guest.dob}" /></td>
                            <td><input type="text" name="country" value="${guest.country}" /></td>
                            <td>
                                <select name="gender">
                                    <option value="Male" ${guest.gender == 'Male' ? 'selected' : ''}>Male</option>
                                    <option value="Female" ${guest.gender == 'Female' ? 'selected' : ''}>Female</option>
                                    <option value="Other" ${guest.gender == 'Other' ? 'selected' : ''}>Other</option>
                                </select>
                            </td>
                            <td>
                                <button type="submit" class="update-btn">Update</button>
                        </form>
                        <form method="post" action="LdeleteServlet"
                              onsubmit="return confirm('Are you sure you want to delete this guest?');"
                              style="display:inline;">
                            <input type="hidden" name="id" value="${guest.id}" />
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