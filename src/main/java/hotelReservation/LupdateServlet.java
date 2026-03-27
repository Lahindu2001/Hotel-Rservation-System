package hotelReservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LupdateServlet")
public class LupdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String dobStr = request.getParameter("dob");
        String country = request.getParameter("country");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password"); // Optional; remove if unused
        String idStr = request.getParameter("id");

        try {
            int guestid = Integer.parseInt(idStr);
            Date dob = Date.valueOf(dobStr);

            // Assuming entryController.updateData(...) updates the database
            boolean success = entryController.updateData(guestid, fullname, email, phone, dob, country, gender, password);

            if (success) {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<script type='text/javascript'>");
                out.println("alert('User account updated successfully!');");
                out.println("window.location.href = 'viewAllGuests';"); // redirect to guest list page
                out.println("</script>");
            } else {
                response.sendRedirect("error.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
