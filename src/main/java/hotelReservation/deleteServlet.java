package hotelReservation;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// take the user id need to delete
		int id = Integer.parseInt(request.getParameter("id"));

		// delete method  call 
		boolean isTrue = entryController.deletedata(id);

		if (isTrue) {
			
			// Session  invalidate  here
			HttpSession session = request.getSession(false);
			if (session != null) session.invalidate();
			
			response.getWriter().println("<script>alert('Profile Deleted Successfully'); window.location.href='index.jsp';</script>");
		} else {

			RequestDispatcher dis2 = request.getRequestDispatcher("error.jsp");
			dis2.forward(request, response);
		}
	}
}
