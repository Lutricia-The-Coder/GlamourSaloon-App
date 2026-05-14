package za.ac.tut.web;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
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
public class BookAppointmentServlet extends HttpServlet {

    @EJB
    AppointmentFacadeLocal afl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String service = request.getParameter("service");

        
        String timeStr = request.getParameter("time");
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime localTime = LocalDateTime.parse(timeStr, fmt);
        Date time = java.sql.Timestamp.valueOf(localTime);
        
        
        if (time.before(new Date())) {
    request.setAttribute("error", "You cannot book an appointment in the past.");
    request.getRequestDispatcher("booking_error.jsp").forward(request, response);
    return;
}
       if (afl.isSlotTaken(time, service)) {
            request.setAttribute("error", "This time slot is already taken for " + service + ".");
            request.getRequestDispatcher("booking_error.jsp").forward(request, response);
            return;
        } 

        Appointment a = new Appointment();
        a.setCustomerName(name);
        a.setServiceType(service);
        a.setAppointmentTime(time);
        a.setStatus("Booked"); // default status
        a.setPaymentStatus("Pending");

        // Persist
        afl.create(a);
        request.setAttribute("appointment", a);
        RequestDispatcher disp=request.getRequestDispatcher("booking_success.jsp");
        disp.forward(request, response);
    }

    
}
