package hotelReservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LahinduUpdateServlet")
public class LahinduUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 🟡 1. Get parameters from form
            String roomType = request.getParameter("room_type");
            double perDayPrice = Double.parseDouble(request.getParameter("per_day_price"));
            boolean availability = Boolean.parseBoolean(request.getParameter("availability"));

            // 🟡 2. Assign to model
            LahinduModel updatedRoom = new LahinduModel(roomType, perDayPrice, availability);

            // 🟡 3. Call controller method
            boolean updateSuccess = LahinduController.updateRoom(updatedRoom);

            // 🟡 4. Handle result
            if (updateSuccess) {
                response.setContentType("text/html");
                response.getWriter().println("<script type='text/javascript'>");
                response.getWriter().println("alert('Room updated successfully!');");
                response.getWriter().println("window.location.href = 'LViewAllroomServlet';");
                response.getWriter().println("</script>");
            } else {
                response.sendRedirect("update-fail.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
