<%@page import="java.util.List"%>
<%@page import="za.ac.tut.model.entity.Appointment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard | Glamour Salon</title>
        <link rel="stylesheet" href="style.css">
        <meta http-equiv="refresh" content="30">
    </head>
    <body>
        <header class="main-header">
            <div class="logo-container">
                <img src="logo.png" alt="Glamour Salon Logo" class="logo">
                <div class="header-text">
                    <h1>Admin Dashboard</h1>
                    <p>Management • Precision • Style</p> 
                </div>
            </div>
        </header>

        <nav>
            <a href="QueueStatusServlet.do"> Queue</a>
            <a href="AnalyticsServlet.do"> Analytics </a>
            <a href="LogoutServlet.do">Logout</a>

        </nav>

        <main class="container">
            <%
                List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
            %>

            <h2>Recent Appointments</h2>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Customer</th>
                            <th>Service</th>
                            <th>Time</th>
                            <th>Status</th>
                            <th>Payment</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (appointments != null) {
                                for (Appointment a : appointments) {
                        %>
                        <tr>
                            <td><%= a.getCustomerName()%></td>
                            <td><%= a.getServiceType()%></td>
                            <td><%= a.getAppointmentTime()%></td>
                            <td>
                                <span class="status-badge status-<%= a.getStatus().toLowerCase().replace(" ", "-")%>">
                                    <%= a.getStatus()%>
                                </span>
                            </td>
                            <td>
                                <span class="payment-badge payment-<%= a.getPaymentStatus().toLowerCase()%>">
                                    <%= a.getPaymentStatus()%>
                                </span>
                            </td>
                            <td>
                                <form action="UpdateStatusServlet.do" method="POST" class="inline-form">
                                    <input type="hidden" name="id" value="<%= a.getId()%>">
                                    <select name="status">
                                        <option value="Booked">Booked</option>
                                        <option value="InProgress">In Progress</option>
                                        <option value="Completed">Completed</option>
                                        <option value="Cancelled">Cancelled</option>
                                    </select>
                                    <input type="submit" value="Update" class="btn-sm">     
                                </form>
                            </td>
                            <td>
                                <form action="DeleteAppointmentServlet.do" method="GET" onsubmit="return confirm('Delete this appointment?')" class="inline-form">
                                    <input type="hidden" name="id" value="<%= a.getId()%>">
                                    <input type="submit" value="Delete" class="btn-danger">
                                </form>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <div class="links-footer">
                <a href="index.html" class="back-link">← Back to Home</a>
            </div>
        </main>

        <footer>
            © 2026 Glamour Salon | Beauty by Lutricia
        </footer>
    </body>
</html>