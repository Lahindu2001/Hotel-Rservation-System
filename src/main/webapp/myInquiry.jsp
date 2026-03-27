<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, hotelReservation.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Inquiries</title>
    <link rel="stylesheet" href="CSSFiles/style.css">
    <link rel="stylesheet" href="CSSFiles/inquiryStyle.css">
    <style>
        #inquiries-container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        #inquiries-title {
            text-align: center;
            margin-bottom: 30px;
        }

        .inquiry-card {
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
        }

        .inquiry-card h3 {
            margin-top: 0;
            color: #444;
        }

        .inquiry-body label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        .inquiry-body input,
        .inquiry-body select,
        .inquiry-body textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .inquiry-body textarea {
            height: 100px;
            resize: vertical;
        }

        .inquiry-actions {
            margin-top: 15px;
            text-align: right;
        }

        .inquiry-actions button {
            padding: 8px 16px;
            margin-left: 10px;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        .inquiry-actions button.update-btn {
            background-color: #007BFF;
        }

        .inquiry-actions button.delete-btn {
            background-color: #dc3545;
        }

        .inquiry-actions button:hover {
            opacity: 0.9;
        }

        #no-inquiries {
            text-align: center;
            padding: 30px;
        }

        .create-inquiry-btn {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border-radius: 5px;
            text-decoration: none;
        }

        .create-inquiry-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<div id="inquiries-container">
    <h2 id="inquiries-title">My Inquiries</h2>

    <%
    ArrayList<dasuInquiryModel> list = (ArrayList<dasuInquiryModel>) request.getAttribute("inquiryDetails");

    if (list != null && !list.isEmpty()) {
    %>
        <%
        for (dasuInquiryModel inquiry : list) {
        %>
            <div class="inquiry-card">
                <h3>Inquiry ID: ${loggedUser.id}</h3>

                <!-- Update Form -->
                <form action="dasuUpdateServlet" method="post" onsubmit ="return validateinquiry()">
                    <input type="text" name="inquiryId" value=${loggedUser.id} hidden >

                    <div class="inquiry-body">
                        <label>Full Name:</label>
                        <input type="text" id="fullName" name="fullName" value="<%= inquiry.getFullName() %>" required />

                        <label>Date:</label>
                        <input type="date" id ="date" name="date" value="<%= inquiry.getDate() %>" required />

                        <label>Email:</label>
                        <input type="email" id="email" name="email" value="<%= inquiry.getEmail() %>" required />

                        <label>Phone:</label>
                        <input type="text" id="phone" name="phone" value="<%= inquiry.getPhone() %>" required />

                        <label>Service Type:</label>
                        <select name="serviceType" required id="serviceType">
                            <option value="">-- Select a Service --</option>
                            <option value="pool" <%= inquiry.getServiceType().equals("pool") ? "selected" : "" %>>Swimming Pool Access</option>
                            <option value="buffet" <%= inquiry.getServiceType().equals("buffet") ? "selected" : "" %>>Buffet Dining Options</option>
                            <option value="bar" <%= inquiry.getServiceType().equals("bar") ? "selected" : "" %>>Bar & Beverage Services</option>
                            <option value="yoga" <%= inquiry.getServiceType().equals("yoga") ? "selected" : "" %>>Yoga and Wellness Sessions</option>
                            <option value="gym" <%= inquiry.getServiceType().equals("gym") ? "selected" : "" %>>Fitness Center Access</option>
                        </select>

                        <label>Message:</label>
                        <textarea name="message" required><%= inquiry.getMessage() %></textarea>
                    </div>

                    <div class="inquiry-actions">
                        <button type="submit" class="update-btn">Update</button>
                    </div>
                </form>

                <!-- Delete Form -->
                <form action="dasuDeleteServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this inquiry?');">
                    <input type="hidden" name="inquiryId" value=${loggedUser.id} />
                    <div class="inquiry-actions">
                        <button type="submit" class="delete-btn">Delete</button>
                    </div>
                </form>
            </div>
        <%
        }
        %>
        </div>
    <%
    } else {
    %>
        <div id="no-inquiries">
            <p>No inquiries found for this user.</p>
            <a href="contactus.jsp" class="create-inquiry-btn">Create New Inquiry</a>
        </div>
    <%
    }
    %>
</div>
<script>
	function validateinquiry(){
		
		
	    const fullName = document.getElementById("fullName").value.trim();
	    const email = document.getElementById("email").value.trim();
	    const phone = document.getElementById("phone").value.trim();
	    const date = document.getElementById("date").value.trim();
	    const service = document.getElementById("serviceType").value;

	    const namePattern = /^[A-Za-z\s]+$/;
	    if (fullName === "" || !namePattern.test(fullName)) {
	        alert("Enter a valid full name (letters only, no special characters).");
	        return false;
	    }

	    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	    if (email === "" || !emailPattern.test(email)) {
	        alert("Enter a valid email address.");
	        return false;
	    }

	    const phonePattern = /^\d{10}$/;
	    if (phone === "" || !phonePattern.test(phone)) {
	        alert("Enter a valid 10-digit phone number.");
	        return false;
	    }

	    if (date === "") {
	        alert("Please select your preferred date.");
	        return false;
	    }

	    if (service === "") {
	        alert("Please select a service to inquire.");
	        return false;
	    }

	    return true;
	    
	}
</script>

<%@ include file="footer.jsp" %>
</body>
</html>
