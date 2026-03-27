<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="hotelReservation.DBConnection" %>

<%
    int guestCount = 0;
    try {
        Connection con = DBConnection.getConnection();
        if (con != null) {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT COUNT(guestid) FROM guestdetails");
            if (rs.next()) {
                guestCount = rs.getInt(1);
            }
            rs.close();
            stmt.close();
            con.close();
        } else {
            System.out.println("Connection returned null.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<%
    int booktCount = 0;
    try {
        Connection con = DBConnection.getConnection();
        if (con != null) {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT COUNT(user_id) FROM booking");
            if (rs.next()) {
                booktCount = rs.getInt(1);
            }
            rs.close();
            stmt.close();
            con.close();
        } else {
            System.out.println("Connection returned null.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<%
    int inqurCount = 0;
    try {
        Connection con = DBConnection.getConnection();
        if (con != null) {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT COUNT(user_id) FROM cus_inquiry");
            if (rs.next()) {
                inqurCount = rs.getInt(1);
            }
            rs.close();
            stmt.close();
            con.close();
        } else {
            System.out.println("Connection returned null.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<%
    int roomCount = 0;
    try {
        Connection con = DBConnection.getConnection();
        if (con != null) {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT COUNT(room_type) FROM room_type");
            if (rs.next()) {
                roomCount = rs.getInt(1);
            }
            rs.close();
            stmt.close();
            con.close();
        } else {
            System.out.println("Connection returned null.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LuxStay - Admin Panel</title>
    <link rel="stylesheet" href="CSSFiles/adminStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .content-number {
            font-size: 32px; /* Increased font size for numbers */
            font-weight: bold; /* Bold weight for emphasis */
            color: inherit; /* Inherits the color from the parent h2 */
            margin-left: 10px; /* Adds space between text and number */
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
                    <li class="active"><a href="adminPannel.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                    <li><a href="LviewallBokkingServlet"><i class="fas fa-calendar-check"></i> Manage Bookings</a></li>
                    <li><a href="viewAllGuests"><i class="fas fa-users"></i> View Guests</a></li>
                    <li><a href="LViewAllroomServlet"><i class="fas fa-door-open"></i> Room Management</a></li>
                    <li><a href="LallInquiryviewServlet"><i class="fas fa-question-circle"></i> Manage Inquiries</a></li>
                    <li><a href="LIncomeReportServlet"><i class="fas fa-chart-line"></i> Income Report</a></li>
                </ul>
            </nav>
            <div class="logout">
                <a href="logoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Top Header -->
            <header class="top-header">
            </header>

            <!-- Content Placeholder -->
            <div class="content-container">
                <h1>Welcome to LuxStay Admin Panel</h1>

                <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 30px; margin-top: 30px;">

                    <!-- Total Guests -->
                    <a href="viewAllGuests" style="text-decoration: none;">
                        <div style="padding: 24px; background: #e6f4ea; border: 1px solid #b5d6c4; border-radius: 12px; text-align: center; box-shadow: 0 4px 10px rgba(0,0,0,0.05);">
                            <h2 style="font-size: 18px; color: #2e7d32; font-weight: 700;">
                                Total Registered Guests: <span class="content-number"><%= guestCount %></span>
                            </h2>
                        </div>
                    </a>

                    <!-- Total Bookings -->
                    <a href="LviewallBokkingServlet" style="text-decoration: none;">
                        <div style="padding: 24px; background: #e3f2fd; border: 1px solid #90caf9; border-radius: 12px; text-align: center; box-shadow: 0 4px 10px rgba(0,0,0,0.05);">
                            <h2 style="font-size: 18px; color: #1565c0; font-weight: 700;">
                                Total Bookings: <span class="content-number"><%= booktCount %></span>
                            </h2>
                        </div>
                    </a>

                    <!-- Available Rooms -->
                    <a href="LViewAllroomServlet" style="text-decoration: none;">
                        <div style="padding: 24px; background: #fff3e0; border: 1px solid #ffcc80; border-radius: 12px; text-align: center; box-shadow: 0 4px 10px rgba(0,0,0,0.05);">
                            <h2 style="font-size: 18px; color: #ef6c00; font-weight: 700;">
                                Available Rooms: <span class="content-number"><%= roomCount %></span>
                            </h2>
                        </div>
                    </a>

                    <!-- Pending Inquiries -->
                    <a href="LallInquiryviewServlet" style="text-decoration: none;">
                        <div style="padding: 24px; background: #fce4ec; border: 1px solid #f8bbd0; border-radius: 12px; text-align: center; box-shadow: 0 4px 10px rgba(0,0,0,0.05);">
                            <h2 style="font-size: 18px; color: #c2185b; font-weight: 700;">
                                Pending Inquiries: <span class="content-number"><%= inqurCount %></span>
                            </h2>
                        </div>
                    </a>

                    <!-- Income Report - Full Width -->
                    <a href="LIncomeReportServlet" style="text-decoration: none; grid-column: span 2;">
                        <div style="padding: 24px; background: #ede7f6; border: 1px solid #d1c4e9; border-radius: 12px; text-align: center; box-shadow: 0 4px 10px rgba(0,0,0,0.05);">
                            <h2 style="font-size: 18px; color: #512da8; font-weight: 700;">
                                Income Report: for <span class="content-number"><%= booktCount %></span> bookings
                            </h2>
                        </div>
                    </a>

                </div>
            </div>
        </div>
    </div>

    <script>
        // Simple JavaScript for navigation
        document.addEventListener('DOMContentLoaded', function() {
            const navItems = document.querySelectorAll('.nav-menu li a');
            
            navItems.forEach(item => {
                item.addEventListener('click', function(e) {
                    // Update active class
                    navItems.forEach(navItem => {
                        navItem.parentElement.classList.remove('active');
                    });
                    this.parentElement.classList.add('active');
                });
            });
        });
    </script>
</body>
</html>