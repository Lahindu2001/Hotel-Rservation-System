<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - LuxStay Hotels</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="CSSFiles/style.css">
    <link rel="stylesheet" href="CSSFiles/aboutusStyle.css">
    <style>
       
    </style>
</head>

<body>
    
            <%@ include file = "header.jsp" %>

    <section class="about-us-section">
        <h2 class="section-title">About LuxStay Hotels</h2>
        <div class="about-content">
            <p class="about-text">
                Welcome to LuxStay Hotels, where luxury meets comfort. We are committed to providing our guests with an
                unforgettable experience through our exceptional service, elegant accommodations, and world-class
                amenities.
                Our mission is to create a home away from home for every traveler, whether you're here for business or
                leisure.
                We believe in attention to detail and personalized service, ensuring every aspect of your stay exceeds
                your expectations.
            </p>
            <p class="about-text">
                Established in [Year], LuxStay Hotels has grown to become a symbol of hospitality and excellence. Our
                team is dedicated to creating a warm and welcoming environment, making your stay both comfortable and
                memorable.
                From our luxurious rooms and suites to our exquisite dining options and state-of-the-art facilities, we
                strive to provide an unparalleled experience.
            </p>

            <div class="team-section">
                <h2>Our Team</h2>
                <div class="team-grid">
                    <div class="team-member">
                        <img src="images/staff/download.jpeg" alt="Team Member 1">
                        <h3>John Doe</h3>
                        <p>General Manager</p>
                    </div>
                    <div class="team-member">
                        <img src="images/staff/72b94154-ccec-49c3-b436-3760c3054f92.jpeg" alt="Team Member 2">
                        <h3>Jane Smith</h3>
                        <p>Head Chef</p>
                    </div>
                    <div class="team-member">
                        <img src="images/staff/How to Deal with Stress & Emotions with Chiva-Som Hua Hin's Wellness Director Chanyapak Suwankantha.jpeg" alt="Team Member 3">
                        <h3>Alice Johnson</h3>
                        <p>Spa Director</p>
                    </div>
                    <div class="team-member">
                        <img src="images/staff/download.jpeg" alt="Team Member 1">
                        <h3>Robert Williams</h3>
                        <p>Front Desk Manager</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

                    <%@ include file = "footer.jsp" %>
    
    <script src="scriptForUserIcon.js"></script>

</body>
</html>