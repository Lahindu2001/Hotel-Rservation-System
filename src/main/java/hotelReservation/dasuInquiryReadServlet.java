package hotelReservation;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dasuInquiryReadServlet")
public class dasuInquiryReadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userId = request.getParameter("user_id");

		// check null
		if (userId == null || userId.isEmpty()) {
			response.getWriter().println("User ID not provided.");
			return;
		}

		ArrayList<dasuInquiryModel> inquiryDetails = dasuInquiryController.getById(userId);

		request.setAttribute("inquiryDetails", inquiryDetails);
		RequestDispatcher dis = request.getRequestDispatcher("myInquiry.jsp");
		dis.forward(request, response);
	}
}
