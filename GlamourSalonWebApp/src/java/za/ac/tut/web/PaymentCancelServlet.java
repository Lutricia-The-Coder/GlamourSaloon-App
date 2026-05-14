
package za.ac.tut.web;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.model.bl.AppointmentFacadeLocal;
import za.ac.tut.model.entity.Appointment;

/**
 *
 * @author lutri
 */
public class PaymentCancelServlet extends HttpServlet {
@EJB private AppointmentFacadeLocal afl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        Long id = Long.valueOf(request.getParameter("appointmentId"));
        Appointment a = afl.find(id);
        if (a != null) {
            a.setPaymentStatus("Cancelled");
         
            afl.edit(a);
        }
        response.sendRedirect("cancel.jsp");
    }
}