<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>LuxStay Hotels - User Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="CSSFiles/style.css" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-image: linear-gradient(rgba(0, 0, 0, 0.5),
                    rgba(0, 0, 0, 0.5)),
                url('images/hotel-room-5858068_1920.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #333;
        }

        .luxstay-banner {
            width: 100%;
            background: linear-gradient(to right,
                    rgba(198, 170, 88, 0.9),
                    rgba(255, 255, 255, 0.95));
            background-image: url('images/luxury-hotel-banner.jpg');
            background-size: cover;
            background-position: center;
            padding: 60px 20px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .luxstay-banner:hover {
            opacity: 0.95;
            transform: scale(1.01);
        }

        .banner-content {
            max-width: 800px;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.85);
            padding: 30px 20px;
            border-radius: 16px;
        }

        .banner-content h1 {
            font-size: 42px;
            color: #333;
            font-weight: bold;
            margin-bottom: 12px;
        }

        .banner-content p {
            font-size: 18px;
            color: #555;
            margin-bottom: 20px;
        }

        .banner-content button {
            padding: 12px 28px;
            font-size: 16px;
            font-weight: bold;
            background-color: #c6aa58;
            color: #fff;
            border: none;
            border-radius: 8px;
            transition: background-color 0.3s;
        }

        .banner-content button:hover {
            background-color: #b2954f;
        }

        .user-details {
            max-width: 700px;
            margin: 60px auto;
            padding: 35px 40px;
            border-radius: 16px;
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }

        .user-details h2 {
            text-align: center;
            margin-bottom: 35px;
            font-size: 28px;
            color: #333;
            font-weight: 600;
        }

        .detail-item {
            margin-bottom: 22px;
            display: flex;
            align-items: center;
        }

        .detail-item strong {
            width: 140px;
            font-weight: 600;
            color: #444;
            font-size: 16px;
        }

        .detail-item input,
        .detail-item select {
            flex-grow: 1;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 16px;
            background-color: #f9f9f9;
            color: #333;
        }

        .detail-item input:focus,
        .detail-item select:focus {
            border-color: #c6aa58;
            outline: none;
            background-color: #fff;
        }

        .detail-item select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%23555' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 15px center;
            padding-right: 40px;
        }

        .password-wrapper {
            position: relative;
            width: 77%;
        }

        .password-wrapper i {
            position: absolute;
            top: 50%;
            right: 12px;
            transform: translateY(-50%);
            cursor: pointer;
            color: #888;
        }

        .btn-group {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 35px;
        }

        .update-btn,
        .remove-btn {
            padding: 13px 28px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 10px;
            cursor: pointer;
            border: none;
            min-width: 160px;
        }

        .update-btn {
            background: linear-gradient(to right, #c6aa58, #d9be7e);
            color: white;
        }

        .update-btn:hover {
            background: linear-gradient(to right, #b2954f, #c6aa58);
        }

        .remove-btn {
            background-color: #fff;
            color: #dc3545;
            border: 2px solid #dc3545;
        }

        .remove-btn:hover {
            background-color: #dc3545;
            color: white;
        }

       
    </style>
</head>

<body>
    <%@ include file="header.jsp" %>

    <!-- Banner -->
    <div class="luxstay-banner" onclick="location.href='index.jsp'">
        <div class="banner-content">
            <h1>Stay with LuxStay</h1>
            <p>Unwind in luxury. Book your perfect escape now!</p>
            <button>Explore & Book Now</button>
        </div>
    </div>

    <!-- Profile Form -->
    <div class="user-details">
        <h2>User Profile</h2>
        <form id="updateForm" action="updateServlet" method="POST" onsubmit="return validateForm()">
            <input type="hidden" name="id" value="${userList.id}" />

            <div class="detail-item">
                <strong>Name:</strong>
                <input type="text" name="fullname" id="nameInput" value="${userList.fullname}" />
            </div>

            <div class="detail-item">
                <strong>Email:</strong>
                <input type="email" name="email" id="emailInput" value="${userList.email}" />
            </div>

            <div class="detail-item">
                <strong>Phone:</strong>
                <input type="tel" name="phone" id="phoneInput" value="${userList.phone}" />
            </div>

            <div class="detail-item">
                <strong>Date of Birth:</strong>
                <input type="date" name="dob" id="dobInput" value="${userList.dob}" />
            </div>

            <div class="detail-item">
                <strong>Gender:</strong>
                <select id="gender" name="gender" required>
                    <option value="">Select Gender</option>
                    <option value="male" ${userList.gender == 'male' ? 'selected' : ''}>Male</option>
                    <option value="female" ${userList.gender == 'female' ? 'selected' : ''}>Female</option>
                    <option value="other" ${userList.gender == 'other' ? 'selected' : ''}>Other</option>
                </select>
            </div>

            <div class="detail-item">
                <strong>Country:</strong>
                <input type="text" name="country" id="numberInput" value="${userList.country}" />
            </div>

            <div class="detail-item">
                <strong>Password:</strong>
                <div class="password-wrapper">
                    <input type="password" name="password" id="passwordInput" value="${userList.password}" readonly/>
                    <i class="fas fa-eye" id="togglePassword"></i>
                </div>
            </div>

            <div class="btn-group">
                <button type="submit" class="update-btn">Update Profile</button>
                <button type="button" class="remove-btn" onclick="confirmDelete()">Remove Account</button>
            </div>
        </form>

        <form id="deleteForm" action="deleteServlet" method="post">
            <input type="hidden" name="id" value="${userList.id}" />
        </form>
    </div>

    <%@ include file="footer.jsp" %>

    <!-- Password Toggle Script -->
    <script>
        const togglePassword = document.getElementById('togglePassword');
        const passwordInput = document.getElementById('passwordInput');

        togglePassword.addEventListener('click', function () {
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });
    </script>

    <script>
        function confirmDelete() {
            if (confirm("Are you sure you want to remove your account? This action cannot be undone.")) {
                document.getElementById("deleteForm").submit();
            }
        }

        function validateForm() {
            const name = document.getElementById("nameInput").value.trim();
            const email = document.getElementById("emailInput").value.trim();
            const phone = document.getElementById("phoneInput").value.trim();
            const dob = document.getElementById("dobInput").value.trim();
            const country = document.getElementById("numberInput").value.trim();
            const gender = document.getElementById("gender").value.trim();
            const password = document.getElementById("passwordInput").value;

            if (!name || /\d/.test(name)) {
                alert("Name cannot be empty or contain numbers.");
                return false;
            }

            if (!email) {
                alert("Email cannot be empty.");
                return false;
            }

            if (!/^\d{10}$/.test(phone)) {
                alert("Phone number must be 10 digits.");
                return false;
            }

            if (!dob) {
                alert("Date of birth cannot be empty.");
                return false;
            }

            if (!country || /\d/.test(country)) {
                alert("Country cannot be empty or contain numbers.");
                return false;
            }

            if (!gender) {
                alert("Please select gender.");
                return false;
            }

            if (password.length < 6) {
                alert("Password must be at least 6 characters.");
                return false;
            }

            return true;
        }
    </script>
</body>

</html>
