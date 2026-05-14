
package za.ac.tut.model.bl;

import java.util.Date;
import java.util.List;
import javax.ejb.Local;
import za.ac.tut.model.entity.Appointment;

/**
 *
 * @author lutri
 */
@Local
public interface AppointmentFacadeLocal {

    void create(Appointment appointment);

    void edit(Appointment appointment);

    void remove(Appointment appointment);

    Appointment find(Object id);

    List<Appointment> findAll();

    List<Appointment> findRange(int[] range);

    int count();

    public List<Appointment> getUpcomingAppointments();

    public void updateStatus(Long id, String newStatus);

    public boolean isSlotTaken(Date time, String serviceType);
public List<Appointment> getAppointmentsByService(String serviceType);
public List<Object[]> getServiceCounts();

public List<Object[]> getStatusCounts();

public List<Object[]> getDailyCounts();
}
