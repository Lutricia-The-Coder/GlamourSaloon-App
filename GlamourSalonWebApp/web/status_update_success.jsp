<%-- 
    Document   : status_update_success
    Created on : 7 May 2026, 15:24:47
    Author     : lutri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Status Update | Glamour Salon</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Playfair Display', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #fefaf8;
                color: #1a1a1a;
                line-height: 1.6;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }

            /* Header Styles */
            .main-header {
                background-color: #fbcce1;
                padding: 40px 20px;
                text-align: center;
                border-bottom: 4px solid #1a1a1a;
            }

            .logo-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }

            .logo {
                height: 120px;
                width: auto;
                margin-bottom: 15px;
            }

            .header-text h1 {
                font-size: 2.5rem;
                text-transform: uppercase;
                letter-spacing: 2px;
                font-weight: 700;
            }

            .header-text p {
                font-size: 1rem;
                letter-spacing: 4px;
                text-transform: uppercase;
                opacity: 0.85;
            }

            /* Navigation */
            nav {
                background-color: #1a1a1a;
                padding: 15px 0;
                display: flex;
                justify-content: center;
                gap: 30px;
                flex-wrap: wrap;
                position: sticky;
                top: 0;
                z-index: 1000;
            }

            nav a {
                text-decoration: none;
                color: #fbcce1;
                font-size: 0.85rem;
                text-transform: uppercase;
                letter-spacing: 1.5px;
                font-weight: 600;
                transition: 0.3s ease;
                padding: 8px 15px;
            }

            nav a:hover {
                color: #ffffff;
                transform: translateY(-2px);
            }

            /* Card Styles */
            .card {
                width: 90%;
                max-width: 550px;
                margin: 80px auto;
                background: #ffffff;
                border: 1px solid #e0d5d5;
                padding: 50px 40px;
                text-align: center;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            }

            /* Success Icon */
            .icon-success {
                font-size: 4rem;
                color: #2ecc71;
                margin-bottom: 20px;
                background-color: rgba(46, 204, 113, 0.1);
                width: 90px;
                height: 90px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-left: auto;
                margin-right: auto;
                font-weight: bold;
            }

            .success-heading {
                color: #2ecc71;
                margin-bottom: 15px;
                font-size: 1.6rem;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            .card p {
                color: #555;
                margin-bottom: 30px;
                font-size: 1rem;
            }

            /* Button Group */
            .button-group {
                display: flex;
                gap: 15px;
                justify-content: center;
                margin-top: 10px;
                flex-wrap: wrap;
            }

            .btn {
                display: inline-block;
                background-color: #1a1a1a;
                color: #ffffff;
                padding: 12px 28px;
                text-decoration: none;
                text-transform: uppercase;
                font-size: 0.8rem;
                letter-spacing: 2px;
                font-weight: 700;
                border: none;
                transition: all 0.3s ease;
                cursor: pointer;
                text-align: center;
                min-width: 180px;
            }

            .btn:hover {
                background-color: #fbcce1;
                color: #1a1a1a;
                transform: translateY(-2px);
            }

            .btn-secondary {
                background-color: #888;
            }

            .btn-secondary:hover {
                background-color: #666;
                color: white;
            }

            /* Footer */
            footer {
                background-color: #1a1a1a;
                color: #ffffff;
                padding: 40px 20px;
                text-align: center;
                font-size: 0.8rem;
                text-transform: uppercase;
                letter-spacing: 2px;
                margin-top: auto;
            }

            /* Responsive */
            @media (max-width: 600px) {
                .logo {
                    height: 80px;
                }
                .header-text h1 {
                    font-size: 1.5rem;
                }
                .header-text p {
                    font-size: 0.7rem;
                    letter-spacing: 2px;
                }
                .card {
                    padding: 30px 20px;
                    margin: 50px auto;
                }
                .success-heading {
                    font-size: 1.2rem;
                }
                .btn {
                    min-width: 140px;
                    padding: 10px 20px;
                    font-size: 0.7rem;
                }
                nav {
                    gap: 15px;
                }
                nav a {
                    font-size: 0.65rem;
                    padding: 5px 10px;
                }
            }
        </style>
    </head>
    <body>

        <header class="main-header">
            <div class="logo-container">
                <img src="logo.png" alt="Glamour Salon Logo" class="logo">
                <div class="header-text">
                    <h1>Status Update</h1>
                    <p>Success • Confirmation • Ready</p>
                </div>
            </div>
        </header>

        <nav>
            <a href="index.html">Home</a>
            <a href="AdminDashboardServlet.do">Dashboard</a>
            <a href="QueueStatusServlet.do">Queue</a>
        </nav>

        <main>
            <div class="card">
                <div class="icon-success">✓</div>
                <h2 class="success-heading">Appointment Status Updated Successfully!</h2>
                <p>The appointment status has been updated in the system.</p>
                <div class="button-group">
                    <a href="AdminDashboardServlet.do" class="btn">Back to Dashboard</a>
                    <a href="index.html" class="btn btn-secondary">Back to Home</a>
                </div>
            </div>
        </main>

        <footer>
            © 2026 Glamour Salon | Beauty by Lutricia
        </footer>

    </body>
</html>