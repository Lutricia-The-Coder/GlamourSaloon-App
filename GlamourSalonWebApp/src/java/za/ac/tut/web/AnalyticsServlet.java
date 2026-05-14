
package za.ac.tut.web;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.model.bl.AppointmentFacadeLocal;

/**
 *
 * @author lutri
 */
public class AnalyticsServlet extends HttpServlet {

   @EJB AppointmentFacadeLocal afl;
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       List<Object[]> serviceCounts = afl.getServiceCounts();
        List<Object[]> statusCounts = afl.getStatusCounts();
        List<Object[]> dailyCounts = afl.getDailyCounts();

        request.setAttribute("serviceCounts", serviceCounts);
        request.setAttribute("statusCounts", statusCounts);
        request.setAttribute("dailyCounts", dailyCounts);

        request.getRequestDispatcher("analytics_dashboard.jsp").forward(request, response);
    }

    
}
