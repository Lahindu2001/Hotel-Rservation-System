package hotelReservation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LahinduDeleteServlet")
public class LahinduDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 🟡 1. Get room_type from request
            String roomType = request.getParameter("room_type");

            // 🟡 2. Call controller method to delete
            boolean isDeleted = LahinduController.deleteRoom(roomType);

            // 🟡 3. Handle result
            if (isDeleted) {
                response.setContentType("text/html");
                response.getWriter().println("<script type='text/javascript'>");
                response.getWriter().println("alert('Room deleted successfully!');");
                response.getWriter().println("window.location.href = 'LViewAllroomServlet';");
                response.getWriter().println("</script>");
            } else {
                response.sendRedirect("delete-fail.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
