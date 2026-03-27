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
    <link rel="stylesheet" href="CSSFiles/roomsStyle.css">

</head>

<body>
	    <%@ include file = "header.jsp" %>
	
    
    <section class="roomDetails">
        <h2 class="section-title">Our Luxury Rooms</h2>

        <div class="rooms-container">
            <div class="room-card">
                <img src="images/hotel rooms thumbnails/1 (6).jpeg" alt="HoneyMoon Suite" class="room-img">
                <div class="room-details">
                    <h3 class="room-title">Deluxe King Room</h3>
                    <p class="room-price">LKR 60,000 <span>/ night</span></p>
                    <p class="room-description">
                        Experience comfort in our Deluxe King Room, featuring a plush king-size bed and modern
                        amenities. Perfect for solo travelers or couples seeking a relaxing stay.
                    </p>
                    <div class="room-features">
                        <div><i class="fas fa-bed"></i> King Bed</div>
                        <div><i class="fas fa-user-friends"></i> 2 Guests</div>
                        <div><i class="fas fa-bath"></i> 1 Bath</div>
                    </div>
                    <a href="index.jsp" class="room-btn">Book Now</a>
                </div>
            </div>

            <div class="room-card">
                <img src="images/hotel rooms thumbnails/1 (2).jpeg" alt="Premium Suite" class="room-img">
                <div class="room-details">
                    <h3 class="room-title">Premium Suite</h3>
                    <p class="room-price">LKR 90,000 <span>/ night</span></p>
                    <p class="room-description">
                        Indulge in our Premium Suite, offering a spacious layout with a separate living area. Enjoy
                        added luxury with two bathrooms and premium furnishings for an unforgettable stay.
                    </p>
                    <div class="room-features">
                        <div><i class="fas fa-bed"></i> King Bed</div>
                        <div><i class="fas fa-user-friends"></i> 2 Guests</div>
                        <div><i class="fas fa-bath"></i> 2 Bath</div>
                    </div>
                    <a href="index.jsp" class="room-btn">Book Now</a>
                </div>
            </div>

            <div class="room-card">
                <img src="images/hotel rooms thumbnails/1 (4).jpeg" alt="Executive Suite" class="room-img">
                <div class="room-details">
                    <h3 class="room-title">Family Room</h3>
                    <p class="room-price">LKR 105,000 <span>/ night</span></p>
                    <p class="room-description">
                        Our Family Room is designed for comfort and convenience, featuring two queen beds and ample
                        space for families. Create lasting memories in this cozy and well-equipped room.
                    </p>
                    <div class="room-features">
                        <div><i class="fas fa-bed"></i> 2 Queen Beds</div>
                        <div><i class="fas fa-user-friends"></i> 4 Guests</div>
                        <div><i class="fas fa-bath"></i> 1 Bath</div>
                    </div>
                    <a href="index.jsp" class="room-btn">Book Now</a>
                </div>
            </div>

            <div class="room-card">
                <img src="images/hotel rooms thumbnails/1 (3).jpeg" alt="Family Room" class="room-img">
                <div class="room-details">
                    <h3 class="room-title">Executive Suite</h3>
                    <p class="room-price">LKR 135,000 <span>/ night</span></p>
                    <p class="room-description">
                        The Executive Suite offers luxury and functionality, with a separate living area and king-size
                        bed. Ideal for business travelers or those seeking extra space and comfort.
                    </p>
                    <div class="room-features">
                        <div><i class="fas fa-bed"></i> King Bed</div>
                        <div><i class="fas fa-user-friends"></i> 2 Guests</div>
                        <div><i class="fas fa-bath"></i> 2 Bath</div>
                        <div><i class="fas fa-couch"></i> Living Area</div>
                    </div>
                    <a href="index.jsp" class="room-btn">Book Now</a>
                </div>
            </div>

            <div class="room-card">
                <img src="images/hotel rooms thumbnails/1 (5).jpeg" alt="Connecting Rooms" class="room-img">
                <div class="room-details">
                    <h3 class="room-title">Connecting Rooms</h3>
                    <p class="room-price">LKR 120,000 <span>/ night</span></p>
                    <p class="room-description">
                        Perfect for larger families or groups, our Connecting Rooms offer two queen beds and two
                        bathrooms, providing both privacy and togetherness. Enjoy the convenience of interconnected
                        spaces.
                    </p>
                    <div class="room-features">
                        <div><i class="fas fa-bed"></i> 2 Queen Beds</div>
                        <div><i class="fas fa-user-friends"></i> 4 Guests</div>
                        <div><i class="fas fa-bath"></i> 2 Bath</div>
                    </div>
                    <a href="index.jsp" class="room-btn">Book Now</a>
                </div>
            </div>

            <div class="room-card">
                <img src="images/hotel rooms thumbnails/1 (1).jpeg" alt="Deluxe Room" class="room-img">
                <div class="room-details">
                    <h3 class="room-title">HoneyMoon Suite</h3>
                    <p class="room-price">LKR 180,000 <span>/ night</span></p>
                    <p class="room-description">
                        Celebrate romance in our luxurious Honeymoon Suite, featuring a king-size bed, jacuzzi, and
                        stunning city views. Create unforgettable moments in this elegant and intimate setting.
                    </p>
                    <div class="room-features">
                        <div><i class="fas fa-bed"></i> King Bed</div>
                        <div><i class="fas fa-user-friends"></i> 2 Guests</div>
                        <div><i class="fas fa-bath"></i> 2 Bath</div>
                        <div><i class="fas fa-hot-tub"></i> Jacuzzi</div>
                        <div><i class="fas fa-city"></i> City View</div>
                    </div>
                    <a href="index.jsp" class="room-btn">Book Now</a>
                </div>
            </div>
        </div>
    </section>
            <%@ include file = "footer.jsp" %>
    
</body>

</html>