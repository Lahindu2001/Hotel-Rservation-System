package hotelReservation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/profileServlet")
public class profileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// Session thru get user data
		entryModel loggedUser = (entryModel) request.getSession().getAttribute("loggedUser");

		if (loggedUser != null) {
			
			
			// userDetails.jsp ekata data yawanawa userList kiyana attrubute name eken
			request.setAttribute("userList", loggedUser); 
			request.getRequestDispatcher("userDetails.jsp").forward(request, response);
		} else {
			
			
			// login error have
			response.sendRedirect("login.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
