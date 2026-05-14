
package za.ac.tut.web;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.model.bl.AppointmentFacadeLocal;

/**
 *
 * @author lutri
 */
public class UpdateStatusServlet extends HttpServlet {
@EJB AppointmentFacadeLocal afl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        Long id = Long.parseLong(request.getParameter("id"));
        String newStatus = request.getParameter("status");
    
    afl.updateStatus(id,newStatus);
    RequestDispatcher disp=request.getRequestDispatcher("status_update_success.jsp");
    disp.forward(request, response);
    
    }

  
}
