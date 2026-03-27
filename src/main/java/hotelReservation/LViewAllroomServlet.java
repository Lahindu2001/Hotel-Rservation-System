package hotelReservation;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LViewAllroomServlet")
public class LViewAllroomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<LahinduModel> roomList = LahinduController.getAllRooms();
            request.setAttribute("roomList", roomList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("allRoom.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Error retrieving room data: " + e.getMessage());
        }
    }
}