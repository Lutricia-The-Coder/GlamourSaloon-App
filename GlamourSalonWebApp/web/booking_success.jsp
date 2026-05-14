<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Booking Confirmation | Glamour Salon</title>
        <link rel="stylesheet" href="style.css"> 
    </head>

    <body>

        <header class="main-header">
            <div class="logo-container">
                <img src="logo.png" alt="Glamour Salon Logo" class="logo">
                <div class="header-text">
                    <h1>Confirmation</h1>
                    <p>Luxury • Style • Confidence</p> 
                </div>
            </div>
        </header>

        <nav>
            <a href="index.html">Home</a>
            <a href="book.jsp">New Booking</a>
            <a href="AdminDashboardServlet.do">Admin</a>
        </nav>

        <div class="form-container">
            <h2>✅ Confirm Appointment</h2>

            <div class="confirmation-details">
                <p><strong>Service:</strong> ${appointment.serviceType}</p>
                <p><strong>Time:</strong> ${appointment.appointmentTime}</p>
                <p><strong>Status:</strong> ${appointment.status}</p>
                <p><strong>Payment:</strong> ${appointment.paymentStatus}</p>
            </div>

            <form action="https://sandbox.payfast.co.za/eng/process" method="post">
                <input type="hidden" name="merchant_id" value="10000100">
                <input type="hidden" name="merchant_key" value="46f0cd694581a">

                <input type="hidden" name="return_url"
                       value="http://localhost:8080/GlamourSalonWebApp/PaymentSuccessServlet.do?appointmentId=${appointment.id}">

                <input type="hidden" name="cancel_url"
                       value="http://localhost:8080/GlamourSalonWebApp/PaymentCancelServlet.do?appointmentId=${appointment.id}">

                <input type="hidden" name="amount" value="200.00">
                <input type="hidden" name="item_name" value="Salon Appointment">

                <input type="submit" value="💳 Pay Now" class="btn">
            </form>
                       <p style="color: red"> <b>No refunds, all payments are final</b></p><br>

            <a href="book.jsp" class="back-link">Book Another</a>
            <a href="index.html" class="back-link">Back to Home</a>
        </div>

        <footer>
            © 2026 Glamour Salon | Beauty by Lutricia
        </footer>

    </body>
</html>