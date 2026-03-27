<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LuxStay - Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="CSSFiles/style.css">
    <link rel="stylesheet" href="CSSFiles/loginStyle.css">
</head>

<body>
    
	 <%@ include file = "header.jsp" %>
	
    <div class="login-container">
        <div class="section2">
            <div class="login-box">
                <h2>Login to LuxStay</h2>
                <form id="loginForm" action="loginServlet" method="POST">
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" required>
                        <div class="error-message" id="emailError"></div>
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" required>
                        <div class="error-message" id="passwordError"></div>
                    </div>
                    <button type="submit">Login</button>
                </form>
                <div class="signup-link">
                    <p>Don't have an account? <a href="signup.jsp">Sign up here</a></p>
                </div>
            </div>
        </div>
    </div>
    
                        <%@ include file = "footer.jsp" %>
    

    <script src="scriptForUserIcon.js"></script>
</body>
</html>
