<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - LuxStay Hotels</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="CSSFiles/style.css">
    <link rel="stylesheet" href="CSSFiles/contactusStyle.css">
 
</head>

<body>
    
        <%@ include file = "header.jsp" %>
    
    <section class="contact-us-section">
        <h2 class="section-title">Make Your Inquiry</h2>
        <div class="contact-content">
            <div class="contact-info">
                <p>We're here to help! Please feel free to contact us with any questions or inquiries.</p>
                <p><i class="fas fa-map-marker-alt"></i> 123 Galle Road, Colombo 03, Sri Lanka</p>
                <p><i class="fas fa-phone-alt"></i> +94 11 234 5678</p>
                <p><i class="fas fa-envelope"></i> contact@luxstayhotels.com</p>
            </div>

            <div class="contact-form">
    <form action="dasuInquiryServlet" method="post" onsubmit="return validateLoginForInquiry()">
        <!-- Hidden user_id input -->
        <input type="text" id="user_id" name="user_id" value="${loggedUser.id}" style="display: none;">

        <label for="fullname">Full Name</label>
        <input type="text" id="fullname" name="fullname" required>

        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" required>

        <label for="phone">Phone Number</label>
        <input type="tel" id="phone" name="phone" required>

        <label for="checkin">Preferred Date</label>
        <input type="date" id="checkin" name="date" required>

        <label for="service">Select Service to Inquire</label>
        <select id="service" name="serviceType" required>
            <option value="">-- Select a Service --</option>
            <option value="pool">Swimming Pool Access</option>
            <option value="buffet">Buffet Dining Options</option>
            <option value="bar">Bar & Beverage Services</option>
            <option value="yoga">Yoga and Wellness Sessions</option>
            <option value="gym">Fitness Center Access</option>
        </select>

        <label for="message">Additional Requests / Message</label>
        <textarea id="message" name="message" rows="5"></textarea>

        <button type="submit">Send Inquiry</button>
    </form>

    <c:if test="${not empty loggedUser}">
        <form action="dasuInquiryReadServlet" method="GET">
            <input type="text" name="user_id" value="${loggedUser.id}" style="display: none;">
            <button type="submit">View My Inquiry</button>
        </form>
    </c:if>
</div>

        </div>
    </section>

            <%@ include file = "footer.jsp" %>
    
    <script src="scriptForUserIcon.js"></script>
    
    <script>
function validateLoginForInquiry() {

	const userId = document.getElementById("user_id").value;
    if (userId.trim() === "") {
        alert("Please login before placing an inquiry.");
        return false;
    }

    const fullName = document.getElementById("fullname").value.trim();
    const email = document.getElementById("email").value.trim();
    const phone = document.getElementById("phone").value.trim();
    const date = document.getElementById("checkin").value.trim();
    const service = document.getElementById("service").value;

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

</body>
</html>