/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
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
public class DeleteAppointmentServlet extends HttpServlet {

    @EJB
    private AppointmentFacadeLocal afl;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Long id = Long.parseLong(
                    request.getParameter("id")
            );

            Appointment a = afl.find(id);

            if (a!= null) {

                afl.remove(a);

            }

            List<Appointment> appointments =
                    afl.findAll();

            request.setAttribute(
                    "appointments",
                    appointments
            );

            request.getRequestDispatcher(
                    "admin_dashboard.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Error deleting appointment"
            );
        }
    }
}