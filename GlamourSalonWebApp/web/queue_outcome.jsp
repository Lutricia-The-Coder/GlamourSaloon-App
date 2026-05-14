<%@page import="java.util.List"%>
<%@page import="za.ac.tut.model.entity.Appointment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Queue Status | Glamour Salon</title>
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <header class="main-header">
            <div class="logo-container">
                <img src="logo.png" alt="Glamour Salon Logo" class="logo">
                <div class="header-text">
                    <h1>Queue Management</h1>
                    <p>Live • Status • Updates</p> 
                </div>
            </div>
        </header>

        <nav>
            <a href="index.html">Home</a>
            <a href="AdminDashboardServlet.do">Admin Dashboard</a>
            <a href="AnalyticsServlet.do"> Analytics </a>
        </nav>

        <main class="container">
            <%
                List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
            %>
            <h2>Current Queue</h2>

            <%
                if (appointments != null && !appointments.isEmpty()) {
            %>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Customer Name</th>
                            <th>Service Type</th>
                            <th>Appointment Time</th>
                            <th>Status</th>
                            <th>Payment</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
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
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <%
            } else {
            %>
            <div class="form-container" style="text-align: center;">
                <p>No appointments found in the queue.</p>
            </div>
            <%
                }
            %>

            <div class="links-footer">
                <a href="index.html" class="back-link">← Back to Home</a>
                <a href="book.jsp" class="back-link">Book Another Appointment</a>
            </div>
        </main>

        <footer>
            © 2026 Glamour Salon | Beauty by Lutricia
        </footer>
    </body>
</html>