package hotelReservation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LahinduInsertServlet")
public class LahinduInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 1. Get form data
            String roomType = request.getParameter("room_type");
            double price = Double.parseDouble(request.getParameter("per_day_price"));
            boolean available = Boolean.parseBoolean(request.getParameter("availability"));

            // 2. Use controller to insert into database
            boolean success = LahinduController.insertRoomType(roomType, price, available);

            // 3. Redirect based on success or failure
            if (success) {
            	response.getWriter().println("<script type='text/javascript'>");
 	            response.getWriter().println("alert('booking Created Successfully!');");
 	            response.getWriter().println("window.location.href = 'LViewAllroomServlet';");  // Redirect to login after alert
 	            response.getWriter().println("</script>");
          
            } else {
                response.sendRedirect("roomFail.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}