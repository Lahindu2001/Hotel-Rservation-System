package hotelReservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LdeleteServlet
 */
@WebServlet("/LdeleteServlet")
public class LdeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// id parameter එක request එකෙන් ගන්නවා
		int id = Integer.parseInt(request.getParameter("id"));

		// delete method එක call කරන්න
		boolean isTrue = entryController.deletedata(id);

		if (isTrue) {
			// Session එක invalidate කරන්න
			HttpSession session = request.getSession(false);
			if (session != null) session.invalidate();
			// delete success නම් alert එකක් පෙන්වා redirect කරන්න
//			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().println("<script>alert('Profile Deleted Successfully'); window.location.href='viewAllGuests';</script>");
		} else {
			// error.jsp එකට යවන්න
			RequestDispatcher dis2 = request.getRequestDispatcher("error.jsp");
			dis2.forward(request, response);
		}
	}
	
	
	

}
