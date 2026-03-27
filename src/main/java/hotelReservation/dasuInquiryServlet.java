package hotelReservation;

import java.io.IOException;	
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/dasuInquiryServlet")
public class dasuInquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String user_id = request.getParameter("user_id");
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String date = request.getParameter("date");
		String serviceType = request.getParameter("serviceType");
		String message = request.getParameter("message");
		
		// Convert user_id to int
		int userID = Integer.parseInt(user_id);

		// Convert date to java.sql.Date
		Date sqlDate = Date.valueOf(date); // Make sure date format is "yyyy-MM-dd" 
		
		boolean isTrue;
		isTrue = dasuInquiryController.insertdata(userID, fullname, email, phone, sqlDate, serviceType, message);
		
		if(isTrue == true) {
            response.getWriter().println("<script>alert('Inquiry Placed Successfully'); window.location='contactus.jsp';</script>");

		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("Wrong.jsp");
			dis2.forward(request, response);
		}
	}

}
