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

</head>

<body>
    <%@ include file = "header.jsp" %>

    <header class="hero">
        <h1>Experience Luxury Like Never Before</h1>
        <p>Discover the perfect balance of luxury, comfort, and exceptional service for an unforgettable stay.</p>
    </header>

    <section class="booking-container">
    <form class="booking-form" action="linukaInsertServlet" method="post" onsubmit="return validateLogin()" >
        <!-- Hidden input for logged-in user ID -->
        <input type="text" id="user_id" name="user_id" value="${loggedUser.id}" style="display:none;">

        <div class="form-group">
            <label for="checkin">Check-in Date</label>
            <input type="date" id="checkin" name="checkin" required>
        </div>

        <div class="form-group">
            <label for="checkout">Check-out Date</label>
            <input type="date" id="checkout" name="checkout" required>
        </div>

        <div class="form-group">
            <label for="adults">Adults</label>
            <select id="adults" name="adults">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
            </select>
        </div>

        <div class="form-group">
            <label for="children">Children</label>
            <select id="children" name="children">
                <option value="0">0</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>
        </div>

        <div class="form-group">
            <label for="room-type">Room Type</label>
            <select id="room-type" name="roomtype" required>
                <option value="">Select Room Type</option>
                <option value="deluxe-king">Deluxe King Room</option>
                <option value="premium-suite">Premium Suite</option>
                <option value="family-room">Family Room</option>
                <option value="executive-suite">Executive Suite</option>
                <option value="connecting-rooms">Connecting Rooms</option>
                <option value="honeymoon-suite">Honeymoon Suite</option>
            </select>
        </div>

        <button type="submit" class="search-btn">Book Your Room</button>
    </form>
</section>

    <section>
        <h2 class="section-title">Our Luxury Rooms</h2>

        <div class="rooms-container">
            <div class="room-card">
                <img src="images/hotel rooms thumbnails/1 (6).jpeg" alt="HoneyMoon Suite" class="room-img">
                <div class="room-details">
                    <h3 class="room-title">Deluxe King Room</h3>
                    <p class="room-price">LKR 60,000 <span>/ night</span></p>
                    <div class="room-features">
                        <div><i class="fas fa-bed"></i> King Bed</div>
                        <div><i class="fas fa-user-friends"></i> 2 Guests</div>
                        <div><i class="fas fa-bath"></i> 1 Bath</div>
                    </div>
                    <a href="#" class="room-btn">Book Now</a>
                </div>
            </div>

            <div class="room-card">
                <img src="images/hotel rooms thumbnails/1 (2).jpeg" alt="Premium Suite" class="room-img">
                <div class="room-details">
                    <h3 class="room-title">Premium Suite</h3>
                    <p class="room-price">LKR 90,000 <span>/ night</span></p>
                    <div class="room-features">
                        <div><i class="fas fa-bed"></i> King Bed</div>
                        <div><i class="fas fa-user-friends"></i> 2 Guests</div>
                        <div><i class="fas fa-bath"></i> 2 Bath</div>
                    </div>
                    <a href="#" class="room-btn">Book Now</a>
                </div>
            </div>

            <div class="room-card">
                <img src="images/hotel rooms thumbnails/1 (4).jpeg" alt="Executive Suite" class="room-img">
                <div class="room-details">
                    <h3 class="room-title">Family Room</h3>
                    <p class="room-price">LKR 105,000 <span>/ night</span></p>
                    <div class="room-features">
                        <div><i class="fas fa-bed"></i> 2 Queen Beds</div>
                        <div><i class="fas fa-user-friends"></i> 4 Guests</div>
                        <div><i class="fas fa-bath"></i> 1 Bath</div>
                    </div>
                    <a href="#" class="room-btn">Book Now</a>
                </div>
            </div>

            <div class="room-card">
                <img src="images/hotel rooms thumbnails/1 (3).jpeg" alt="Family Room" class="room-img">
                <div class="room-details">
                    <h3 class="room-title">Executive Suite</h3>
                    <p class="room-price">LKR 135,000 <span>/ night</span></p>
                    <div class="room-features">
                        <div><i class="fas fa-bed"></i> King Bed</div>
                        <div><i class="fas fa-bath"></i> 2 Bath</div>
                        <div><i class="fas fa-couch"></i> Living Area</div>
                    </div>
                    <a href="#" class="room-btn">Book Now</a>
                </div>
            </div>

            <div class="room-card">
                <img src="images/hotel rooms thumbnails/1 (5).jpeg" alt="Connecting Rooms" class="room-img">
                <div class="room-details">
                    <h3 class="room-title">Connecting Rooms</h3>
                    <p class="room-price">LKR 120,000 <span>/ night</span></p>
                    <div class="room-features">
                        <div><i class="fas fa-bed"></i> 2 Queen Beds</div>
                        <div><i class="fas fa-user-friends"></i> 4 Guests</div>
                        <div><i class="fas fa-bath"></i> 2 Bath</div>
                    </div>
                    <a href="#" class="room-btn">Book Now</a>
                </div>
            </div>

            <div class="room-card">
                <img src="images/hotel rooms thumbnails/1 (1).jpeg" alt="Deluxe Room" class="room-img">
                <div class="room-details">
                    <h3 class="room-title">HoneyMoon Suite</h3>
                    <p class="room-price">LKR 180,000 <span>/ night</span></p>
                    <div class="room-features">
                        <div><i class="fas fa-bed"></i> King Bed</div>
                        <div><i class="fas fa-user-friends"></i> 2 Guests</div>
                        <div><i class="fas fa-bath"></i> 2 Bath</div>
                        <div><i class="fas fa-hot-tub"></i> Jacuzzi</div>
                    </div>
                    <a href="#" class="room-btn">Book Now</a>
                </div>
            </div>
        </div>
    </section>

    <section class="hotel-images">
        <h2 class="section-title">Hotel Gallery</h2>
        <div class="images-container">
            <img src="images/hotel gallery/Free Elegant Hotel Lobby Image _ Download at StockCake.jpeg"
                alt="Hotel Lobby">
            <img src="images/hotel gallery/Seoul_ One of the Most Beautiful Four Seasons Hotels.jpeg"
                alt="Hotel Restaurant">
            <img src="images/hotel gallery/Sunning Luxury Hotel’s Pools.jpeg" alt="Hotel Pool">
            <img src="images/hotel gallery/Spa seating.jpeg" alt="Hotel Spa">
            <img src="images/hotel gallery/Wellness — Studio LOST.jpeg" alt="Hotel Gym">
        </div>
    </section>

    <section class="testimonials">
        <h2 class="section-title">What Our Guests Say</h2>

        <div class="testimonials-container">
            <div class="testimonial-card">
                <p class="testimonial-text">
                    Staying at LuxStay was an amazing experience. The staff was incredibly attentive and the rooms were
                    spotless. I particularly enjoyed the spa facilities!
                </p>
                <div class="testimonial-author">
                    <img src="images/testimonials/b1 (1).jpeg" alt="Sarah Johnson" class="testimonial-avatar">
                    <div class="author-info">
                        <h4>Sarah Johnson</h4>
                        <p>New York, USA</p>
                        <div class="rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div class="testimonial-card">
                <p class="testimonial-text">
                    The perfect getaway! The mountain views from our room were breathtaking, and the restaurant served
                    some of the best food I've ever tasted. Will definitely return!
                </p>
                <div class="testimonial-author">
                    <img src="images/testimonials/g1.jpeg" alt="James Wilson" class="testimonial-avatar">
                    <div class="author-info">
                        <h4>James Wilson</h4>
                        <p>London, UK</p>
                        <div class="rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div class="testimonial-card">
                <p class="testimonial-text">
                    We celebrated our anniversary at LuxStay and the team went above and beyond to make it special. The
                    attention to detail was impressive. Highly recommend!
                </p>
                <div class="testimonial-author">
                    <img src="images/testimonials/g2.jpeg" alt="Sophia Chen" class="testimonial-avatar">
                    <div class="author-info">
                        <h4>Sophia Chen</h4>
                        <p>Toronto, Canada</p>
                        <div class="rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="testimonial-card">
                <p class="testimonial-text">
                    LuxStay made my business trip a pleasure. The conference facilities were top-notch and the staff was
                    extremely professional.
                </p>
                <div class="testimonial-author">
                    <img src="images/testimonials/b1 (2).jpeg" alt="Michael Brown" class="testimonial-avatar">
                    <div class="author-info">
                        <h4>Michael Brown</h4>
                        <p>Sydney, Australia</p>
                        <div class="rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div class="testimonial-card">
                <p class="testimonial-text">
                    The family room was perfect for our vacation. Kids loved the pool and the breakfast buffet was
                    delicious.
                </p>
                <div class="testimonial-author">
                    <img src="images/testimonials/b1 (3).jpeg" alt="Emily Davis" class="testimonial-avatar">
                    <div class="author-info">
                        <h4>Emily Davis</h4>
                        <p>Berlin, Germany</p>
                        <div class="rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div class="testimonial-card">
                <p class="testimonial-text">
                    The concierge service was exceptional. They helped us plan our sightseeing and made our stay
                    unforgettable.
                </p>
                <div class="testimonial-author">
                    <img src="images/testimonials/g3.jpeg" alt="David Lee" class="testimonial-avatar">
                    <div class="author-info">
                        <h4>David Lee</h4>
                        <p>Tokyo, Japan</p>
                        <div class="rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    	<script>
    	 // Set minimum and maximum date for both check-in and check-out fields
        window.onload = function() {
            const today = new Date();
            const oneMonthLater = new Date(today);
            oneMonthLater.setMonth(today.getMonth() + 1);
            
            // Format today's date for min attribute
            const dd = String(today.getDate()).padStart(2, '0');
            const mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
            const yyyy = today.getFullYear();
            const todayFormatted = yyyy + '-' + mm + '-' + dd;
            
            // Format one month later date for max attribute
            const maxDd = String(oneMonthLater.getDate()).padStart(2, '0');
            const maxMm = String(oneMonthLater.getMonth() + 1).padStart(2, '0');
            const maxYyyy = oneMonthLater.getFullYear();
            const maxDateFormatted = maxYyyy + '-' + maxMm + '-' + maxDd;
            
            // Set min and max for check-in
            const checkinInput = document.getElementById('checkin');
            checkinInput.min = todayFormatted;
            checkinInput.max = maxDateFormatted;
            
            // Set min and max for check-out (initially)
            const checkoutInput = document.getElementById('checkout');
            checkoutInput.min = todayFormatted;
            checkoutInput.max = maxDateFormatted;
            
            // Add event listener to check-in date to update minimum check-out date
            checkinInput.addEventListener('change', function() {
                const checkinDate = new Date(this.value);
                const nextDay = new Date(checkinDate);
                nextDay.setDate(nextDay.getDate() + 1);
                
                const nextDd = String(nextDay.getDate()).padStart(2, '0');
                const nextMm = String(nextDay.getMonth() + 1).padStart(2, '0');
                const nextYyyy = nextDay.getFullYear();
                
                const nextDayFormatted = nextYyyy + '-' + nextMm + '-' + nextDd;
                checkoutInput.min = nextDayFormatted;
                
                // If current checkout is now invalid (same as or earlier than checkin), reset it
                if (checkoutInput.value && new Date(checkoutInput.value) <= checkinDate) {
                    checkoutInput.value = nextDayFormatted;
                }
            });
        }
        
        function validateLogin() {
            const userId = document.getElementById("user_id").value;
            if (!userId || userId.trim() === "") {
                alert("Please log in first to book a room.");
                return false;
            }
            
            // Get the dates
            const checkinDate = new Date(document.getElementById('checkin').value);
            const checkoutDate = new Date(document.getElementById('checkout').value);
            const today = new Date();
            today.setHours(0, 0, 0, 0); // Reset time part for proper comparison
            
            // Calculate one month from today for maximum booking date
            const oneMonthLater = new Date(today);
            oneMonthLater.setMonth(today.getMonth() + 1);
            oneMonthLater.setHours(23, 59, 59, 999); // End of the day
            
            // Validate that dates are not in the past
            if (checkinDate < today) {
                alert("Check-in date cannot be in the past.");
                return false;
            }
            
            if (checkoutDate < today) {
                alert("Check-out date cannot be in the past.");
                return false;
            }
            
            // Validate that dates are not more than one month in the future
            if (checkinDate > oneMonthLater) {
                alert("Check-in date cannot be more than one month from today.");
                return false;
            }
            
            if (checkoutDate > oneMonthLater) {
                alert("Check-out date cannot be more than one month from today.");
                return false;
            }
            
            // Validate that checkout is after checkin
            if (checkoutDate <= checkinDate) {
                alert("Check-out date must be after check-in date.");
                return false;
            }
            
            return true;
        }
    
</script>


        <%@ include file = "footer.jsp" %>
</body>

</html>