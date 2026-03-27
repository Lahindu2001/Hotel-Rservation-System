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
    <link rel="stylesheet" href="CSSFiles/facilities.css">
    
</head>

<body>
            <%@ include file = "header.jsp" %>

    <section class="facilities-images">
        <h2 class="section-title">Hotel Facilities</h2>
        <div class="facilities-images-container">
            <div class="facility-item">
                <img src="images/hotel gallery/Free Elegant Hotel Lobby Image _ Download at StockCake.jpeg"
                    alt="Hotel Lobby">
                <h3 class="facility-title">Elegant Lobby</h3>
                <p class="facility-description">Our elegant lobby welcomes you with sophisticated design and a warm,
                    inviting atmosphere, setting the perfect tone for your stay.</p>
            </div>
            <div class="facility-item">
                <img src="images/hotel gallery/Seoul_ One of the Most Beautiful Four Seasons Hotels.jpeg"
                    alt="Hotel Restaurant">
                <h3 class="facility-title">Gourmet Restaurant</h3>
                <p class="facility-description">Dine in style at our restaurant, where world-class chefs create culinary
                    masterpieces using the finest local and international ingredients.</p>
            </div>
            <div class="facility-item">
                <img src="images/hotel gallery/Sunning Luxury Hotel’s Pools.jpeg" alt="Hotel Pool">
                <h3 class="facility-title">Luxury Pool</h3>
                <p class="facility-description">Relax and rejuvenate in our stunning outdoor pool, surrounded by lush
                    gardens and offering a tranquil escape from the city.</p>
            </div>
            <div class="facility-item">
                <img src="images/hotel gallery/Spa seating.jpeg" alt="Hotel Spa">
                <h3 class="facility-title">Relaxing Spa</h3>
                <p class="facility-description">Indulge in ultimate relaxation at our spa, featuring a range of treatments
                    designed to soothe your mind, body, and soul.</p>
            </div>
            <div class="facility-item">
                <img src="images/hotel gallery/Wellness — Studio LOST.jpeg" alt="Hotel Gym">
                <h3 class="facility-title">Fitness Center</h3>
                <p class="facility-description">Stay fit and energized in our state-of-the-art fitness center, equipped with
                    the latest equipment and offering panoramic city views.</p>
            </div>
            <div class="facility-item">
                <img src="images/hotel gallery/Free Elegant Hotel Lobby Image _ Download at StockCake.jpeg" alt="Hotel Bar">
                <h3 class="facility-title">Stylish Bar</h3>
                <p class="facility-description">Enjoy a selection of premium beverages and cocktails in our stylish bar, the perfect spot for unwinding after a long day.</p>
            </div>
        </div>
    </section>

                <%@ include file = "footer.jsp" %>
    
    <script src="scriptForUserIcon.js"></script>

</body>
</html>