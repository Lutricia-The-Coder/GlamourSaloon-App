
package za.ac.tut.web;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.model.bl.AppointmentFacadeLocal;
import za.ac.tut.model.entity.Appointment;

/**
 *
 * @author lutri
 */
public class AdminDashboardServlet extends HttpServlet {
@EJB AppointmentFacadeLocal afl;
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
         List<Appointment> appointments = afl.getUpcomingAppointments();
        request.setAttribute("appointments", appointments);
      RequestDispatcher disp= request.getRequestDispatcher("admin_dashboard.jsp");
              disp.forward(request, response);
        
    }

   
}
