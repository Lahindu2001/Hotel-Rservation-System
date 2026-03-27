<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar">
    <a href="index.jsp" class="logo"><i class="fas fa-hotel"></i>LuxStay</a>
    <ul class="nav-links">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="rooms.jsp">Rooms</a></li>
        <li><a href="facilities.jsp">Facilities</a></li>
        <li><a href="aboutus.jsp">About Us</a></li>
        <li><a href="contactus.jsp">Send Inquiry</a></li>
    </ul>

    <!-- Check if user is logged in -->
    <c:if test="${not empty loggedUser}">
    <h3 style="font-family: 'Segoe UI', sans-serif;
               font-size: 18px;
               color: #c6aa58;
               font-weight: 500;
               margin: 15px 0;
               text-align: right;
               padding-right: 20px;
               display: flex;
               align-items: center;
               justify-content: flex-end;
               gap: 8px;">
        <i class="fa fa-sign-in" style="font-size: 20px; color: #c6aa58;"></i>
        Welcome, ${loggedUser.fullname}
    </h3>
    </c:if>

    <div class="nav-buttons">
        <a href="index.jsp" class="book-btn">Book Now</a>
        <div class="profile-icon">
            <i class="fas fa-user"></i>
            <div class="profile-dropdown">
                <ul>
                    <li><a href="profileServlet">My Profile</a></li>
                    
                    <!-- Pass user_id to the My Bookings page -->
                    <li><a href="myBooking.jsp?user_id=${loggedUser.id}">My Bookings</a></li>

                    <!-- Show SignOut only if user is logged in -->
                    <c:if test="${not empty loggedUser}">
                        <li><a href="logoutServlet">SignOut</a></li>  
                    </c:if>

                    <!-- Show Login only if user is NOT logged in -->
                    <c:if test="${empty loggedUser}">
                        <li><a href="signup.jsp">Sign Up</a></li>
                        <li><a href="login.jsp">Login</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>

    <div class="hamburger">
        <i class="fas fa-bars"></i>
    </div>
</nav>

<script>
    // Get the user icon and dropdown elements
    const profileIcon = document.querySelector(".profile-icon");
    const profileDropdown = document.querySelector(".profile-dropdown");

    // Toggle dropdown visibility on icon click
    profileIcon.addEventListener("click", function (event) {
        event.stopPropagation(); // Prevent event from bubbling to document
        profileDropdown.style.display = profileDropdown.style.display === "block" ? "none" : "block";
    });

    // Hide dropdown if clicked outside
    document.addEventListener("click", function () {
        profileDropdown.style.display = "none";
    });
</script>
