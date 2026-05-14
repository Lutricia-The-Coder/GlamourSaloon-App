
package za.ac.tut.model.bl;

import java.util.Date;
import java.util.List;
import javax.annotation.security.PermitAll;
import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import za.ac.tut.model.entity.Appointment;

/**
 *
 * @author lutri
 */
@Stateless
public class AppointmentFacade extends AbstractFacade<Appointment> implements AppointmentFacadeLocal {

    @PersistenceContext(unitName = "GlamourSalonEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AppointmentFacade() {
        super(Appointment.class);
    }
      @Override

    public List<Appointment> getUpcomingAppointments() {
      return em.createQuery(
        "SELECT a FROM Appointment a ORDER BY a.appointmentTime ASC",
        Appointment.class
    ).getResultList();
    }
        @Override


    public void updateStatus(Long id, String newStatus) {
Appointment a = em.find(Appointment.class, id);
        if (a != null) {
            a.setStatus(newStatus);
            em.merge(a);
        }
    }
    @Override
 
   public boolean isSlotTaken(Date time, String serviceType) {
    Long count = em.createQuery(
        "SELECT COUNT(a) FROM Appointment a WHERE a.appointmentTime = :time AND a.serviceType = :service",
        Long.class
    ).setParameter("time", time)
     .setParameter("service", serviceType)
     .getSingleResult();
    return count > 0;
}
   @Override

   public List<Appointment> getAppointmentsByService(String serviceType) {
    return em.createQuery(
        "SELECT a FROM Appointment a WHERE a.serviceType = :service ORDER BY a.appointmentTime ASC",
        Appointment.class
    ).setParameter("service", serviceType)
     .getResultList();
}
   
   @Override

// Count appointments by service type
public List<Object[]> getServiceCounts() {
    return em.createQuery(
        "SELECT a.serviceType, COUNT(a) FROM Appointment a GROUP BY a.serviceType",
        Object[].class
    ).getResultList();
}

@Override

// Count appointments by status
public List<Object[]> getStatusCounts() {
    return em.createQuery(
        "SELECT a.status, COUNT(a) FROM Appointment a GROUP BY a.status",
        Object[].class
    ).getResultList();
}
@Override

// Count appointments per day
public List<Object[]> getDailyCounts() {
    return em.createQuery(
        "SELECT FUNCTION('DATE', a.appointmentTime), COUNT(a) " +
        "FROM Appointment a GROUP BY FUNCTION('DATE', a.appointmentTime)",
        Object[].class
    ).getResultList();
}

    
}
