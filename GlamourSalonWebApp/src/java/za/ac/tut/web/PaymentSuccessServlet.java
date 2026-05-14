
package za.ac.tut.web;

import java.io.IOException;
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
public class PaymentSuccessServlet extends HttpServlet {

@EJB private AppointmentFacadeLocal afl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        Long id = Long.valueOf(request.getParameter("appointmentId"));
        Appointment a = afl.find(id);
        if (a != null) {
            a.setPaymentStatus("Paid");
            a.setStatus("Confirmed");
            afl.edit(a);
            request.setAttribute("appointment", a);
        }
        RequestDispatcher disp= request.getRequestDispatcher("confirmation.jsp");
                   disp.forward(request, response);
    }
}
