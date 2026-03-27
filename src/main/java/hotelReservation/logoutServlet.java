package hotelReservation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/logoutServlet")
public class logoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Session එක invalidate කරන්න
		HttpSession session = request.getSession(false); // existing session is have ?

		if (session != null) {
			session.invalidate(); // exit session (logout)
		}

		
		response.sendRedirect("index.jsp");
	}
}
