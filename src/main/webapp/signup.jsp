<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LuxStay Hotels - Luxury Accommodations</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="CSSFiles/style.css">
    <link rel="stylesheet" href="CSSFiles/signupStyle.css">
    
</head>

<body>
    <%@ include file = "header.jsp" %>
    

    <div class="signup-container">
        <div class="section1">
            <img src="images/signupbanner.jpeg" alt="">
        </div>
        <div class="section2">
            <h2>Sign Up for LuxStay</h2>
        <form id="signupForm" action="entryServlet" method="POST"  onsubmit="return validateForm()">
            <div class="form-group">
                <label for="fullname">Full Name:</label>
                <input type="text" id="fullname" name="fullname" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" required>
            </div>
            <div class="form-group">
                <label for="dob">Country/Region:</label>
                <input type="text" id="country" name="country" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select id="gender" name="gender" required>
                    <option value="">Select Gender</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <button type="submit">Register</button>
        </form>
        <div class="login-link">
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
        </div>
    </div>

	<%@ include file = "footer.jsp" %>
	<script>
    function validateForm() {
        var name = document.getElementById("fullname").value.trim();
        var email = document.getElementById("email").value.trim();
        var phone = document.getElementById("phone").value.trim();
        var dob = document.getElementById("dob").value.trim();
        var country = document.getElementById("country").value.trim();
        var gender = document.getElementById("gender").value;
        var password = document.getElementById("password").value;

        if (name === "") {
            alert("Cannot Be NULL ");
            return false;
        }

        if (/\d/.test(name)) {
            alert("Cannot contain Special charachters");
            return false;
        }

        if (email === "") {
            alert("Enter Mobile Number");
            return false;
        }

        if (phone === "") {
            alert("Enter Mobile Number");
            return false;
        }

        if (!/^\d{10}$/.test(phone)) {
            alert("Must have 10 Numbers");
            return false;
        }

        if (dob === "") {
            alert("Enter Date");
            return false;
        }

        if (country === "") {
            alert("Cannot contain Special charachters");
            return false;
        }
        
        if (/\d/.test(country)) {
            alert("Cannot contain Special charachters");
            return false;
        }

        if (gender === "") {
            alert("Select Gender");
            return false;
        }

        if (password.length < 6) {
            alert("Password Must have 6 charachters");
            return false;
        }

        return true; 
    }
</script>

	
</body>
</html>