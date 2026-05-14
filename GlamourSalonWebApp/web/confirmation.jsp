<%-- 
    Document   : confirmation
    Created on : 7 May 2026, 21:28:40
    Author     : lutri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Success</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>💳 Payment Status</header>
        <nav>
            <a href="index.html">Home</a>
            <a href="LogoutServlet.do">Logout</a>

        </nav>
        <main>
            <div class="card">
                <h2>✅ Payment Successful!</h2>

                <p><strong>Customer:</strong>
                    ${appointment.customerName}</p>

                <p><strong>Service:</strong>
                    ${appointment.serviceType}</p>

                <p><strong>Status:</strong>
                    ${appointment.status}</p>

                <p><strong>Payment:</strong>
                    ${appointment.paymentStatus}</p>
            </div>
        </main>
    </body>
</html>
