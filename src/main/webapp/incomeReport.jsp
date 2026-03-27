<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LuxStay - Income Report</title>
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
                <li><a href="LallInquiryviewServlet"><i class="fas fa-question-circle"></i> Manage Inquiries</a></li>
                <li class="active"><a href="LIncomeReportServlet"><i class="fas fa-chart-line"></i> Income Report</a></li>
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

        <!-- Income Report Content -->
        <div class="content-container">
            <h2>Income Report</h2>
            <c:if test="${empty incomeReport}">
                <p>No data available to display.</p>
            </c:if>
            <c:if test="${not empty incomeReport}">
                <table>
                    <tr>
                        <th>Room Type</th>
                        <th>Price Per Day</th>
                        <th>Check-in Date</th>
                        <th>Check-out Date</th>
                        <th>Income Price</th>
                    </tr>
                    <c:forEach var="report" items="${incomeReport}">
                        <tr>
                            <td>${report.roomType}</td>
                            <td>${report.perDayPrice}</td>
                            <td>${report.checkinDate}</td>
                            <td>${report.checkoutDate}</td>
                            <td>${report.incomePrice}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>