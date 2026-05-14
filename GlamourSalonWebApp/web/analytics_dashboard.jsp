<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Analytics Dashboard | Glamour Salon</title>
        <link rel="stylesheet" href="style.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>

        <header class="main-header">
            <div class="logo-container">
                <img src="logo.png" alt="Glamour Salon Logo" class="logo">
                <div class="header-text">
                    <h1>Salon Analytics</h1>
                    <p>Growth • Trends • Performance</p> 
                </div>
            </div>
        </header>

        <nav>
            <a href="index.html">Home</a>
            <a href="AdminDashboardServlet.do">Dashboard</a>
            <a href="LogoutServlet.do">Logout</a>
        </nav>

        <main class="container">
            <h2>Business Insights</h2>

            <div class="dashboard-grid">
                <div class="chart-card">
                    <canvas id="serviceChart"></canvas>
                </div>
                <div class="chart-card">
                    <canvas id="statusChart"></canvas>
                </div>
                <div class="chart-card">
                    <canvas id="dailyChart"></canvas>
                </div>
            </div>
        </main>    

        <script>
            // Service chart (Bar)
            const serviceData = {
            labels: [<c:forEach var="s" items="${serviceCounts}">'${s[0]}',</c:forEach>],
                    datasets: [{
                    label: 'Appointments by Service',
                            data: [<c:forEach var="s" items="${serviceCounts}">${s[1]},</c:forEach>],
                            backgroundColor: '#fbcce1',
                            borderColor: '#1a1a1a',
                            borderWidth: 1
                    }]
            };
            new Chart(document.getElementById('serviceChart'), {
            type: 'bar',
                    data: serviceData,
                    options: {
                    responsive: true,
                            plugins: { title: { display: true, text: 'Appointments by Service', font: { family: 'Playfair Display', size: 16 } } }
                    }
            });
            // Status chart (Pie)
            const statusData = {
            labels: [<c:forEach var="s" items="${statusCounts}">'${s[0]}',</c:forEach>],
                    datasets: [{
                    label: 'Appointments by Status',
                            data: [<c:forEach var="s" items="${statusCounts}">${s[1]},</c:forEach>],
                            backgroundColor: [
                                    '#e74c3c', // Cancelled
                                    '#3498db', // In Progress
                                    '#fbcce1', // Booked
                                    '#2ecc71'  // Completed
                            ]
                    }]
            };
            new Chart(document.getElementById('statusChart'), {
            type: 'pie',
                    data: statusData,
                    options: {
                    responsive: true,
                            plugins: { title: { display: true, text: 'Appointments by Status', font: { family: 'Playfair Display', size: 16 } } }
                    }
            });
            // Daily chart (Line)
            const dailyData = {
            labels: [<c:forEach var="d" items="${dailyCounts}">'${d[0]}',</c:forEach>],
                    datasets: [{
                    label: 'Appointments per Day',
                            data: [<c:forEach var="d" items="${dailyCounts}">${d[1]},</c:forEach>],
                            borderColor: '#1a1a1a',
                            backgroundColor: '#fbcce1',
                            fill: true,
                            tension: 0.3
                    }]
            };
            new Chart(document.getElementById('dailyChart'), {
            type: 'line',
                    data: dailyData,
                    options: {
                    responsive: true,
                            plugins: { title: { display: true, text: 'Appointments per Day', font: { family: 'Playfair Display', size: 16 } } }
                    }
            });
        </script>

        <footer>
            © 2026 Glamour Salon | Beauty by Lutricia
        </footer>

    </body>
</html>