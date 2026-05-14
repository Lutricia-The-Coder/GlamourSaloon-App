<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Appointment | Glamour Salon</title>
        <link rel="stylesheet" href="style.css"> 
    </head>
    <body>

        <header class="main-header">
            <div class="logo-container">
                <img src="logo.png" alt="Glamour Salon Logo" class="logo">
                <div class="header-text">
                    <h1>Book Appointment</h1>
                    <p>Beauty • Style • Confidence</p> 
                </div>
            </div>
        </header>

        <nav>
            <a href="index.html">Home</a>
            <a href="book.jsp">Book Appointment</a>
        </nav>

        <div class="form-container">
            <h2>Secure Your Spot</h2>
            <form action="BookAppointmentServlet.do" method="POST">
                <table>
                    <tr>
                        <td><label for="name">Name:</label></td>
                        <td><input type="text" id="name" name="name" placeholder="Enter your full name" required></td>
                    </tr>
                    <tr>
                        <td><label for="service">Service:</label></td>
                        <td>
                            <select id="service" name="service" required>
                                <option value="" disabled selected>Select a service</option>
                                <option value="installation">Installation</option>
                                <option value="braids">Braids</option>
                                <option value="haircut">Hair Cut</option>
                                <option value="hairdye">Hair Dye</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="time">Time:</label></td>
                        <td><input type="datetime-local" id="time" name="time" required></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Confirm Booking" class="btn">
                        </td>
                    </tr>
                </table>
            </form>
            <a href="index.html" class="back-link">← Back to Home</a>
            <a href="LogoutServlet.do" class="back-link">← Logout</a>
        </div>

        <footer>
            © 2026 Glamour Salon | Beauty by Lutricia
        </footer>

    </body>
</html>