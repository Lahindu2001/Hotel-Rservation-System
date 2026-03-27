<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LuxStay - Manage Inquiries</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* SAME STYLES AS allusers.jsp */
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
        input[type="text"], input[type="date"] { width: 100%; padding: 5px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
        select { width: 100%; padding: 5px; box-sizing: border-box; border-radius: 4px; }
        td form { margin: 0; display: inline; }
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
                <li><a href="LViewAllroomServlet"><i class="fas fa-door-open"></i> Room Management</a></li>
                <li class="active"><a href="LallInquiryviewServlet"><i class="fas fa-question-circle"></i> Manage Inquiries</a></li>
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

        <!-- Inquiry Table Content -->
        <div class="content-container">
            <h2>All Inquiries</h2>
            <table>
                <tr>
                    <th>Inquiry ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>date</th>
                    <th>serviceType</th>
                    <th>Message</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="inquiry" items="${allInquiry}">
    <tr>
        <td>${inquiry.user_id}</td>
        <td>${inquiry.fullName}</td>
        <td>${inquiry.email}</td>
        <td>${inquiry.phone}</td>
        <td>${inquiry.date}</td>
        <td>${inquiry.serviceType}</td>
        <td>${inquiry.message}</td>
        <td>
            <form method="post" action="LdeleteInquiryServlet"
                  onsubmit="return confirm('Are you sure you want to delete this inquiry?');"
                  style="display:inline;">
                <input type="hidden" name="user_id" value="${inquiry.user_id}" />
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
