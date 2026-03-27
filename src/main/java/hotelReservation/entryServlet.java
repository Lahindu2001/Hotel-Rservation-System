package hotelReservation;

import java.io.IOException;	
import java.sql.Date ;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/entryServlet")
public class entryServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("fullname");
	    String email = request.getParameter("email");
	    String phone = request.getParameter("phone");
	    String dateString = request.getParameter("dob");
	    String country = request.getParameter("country");
	    String gender = request.getParameter("gender");
	    String password = request.getParameter("password");

	    Date sqlDate = Date.valueOf(dateString);
	    
	    
	    
	    entryModel entry = new entryModel(0, fullname, email, phone, sqlDate, country, gender, password);

	    entryController controller = new entryController();
	    boolean success = controller.addEntry(entry);

	    if (success) {
	    	 response.getWriter().println("<script type='text/javascript'>");
	            response.getWriter().println("alert('Profile Created Successfully!');");
	            response.getWriter().println("window.location.href = 'login.jsp';");  
	            response.getWriter().println("</script>");
	    } else {
	        request.getRequestDispatcher("error.jsp").forward(request, response);
	    }
	
	}

}
