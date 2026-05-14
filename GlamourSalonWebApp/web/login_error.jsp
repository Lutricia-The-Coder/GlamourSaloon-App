<%-- 
    Document   : login_error
    Created on : 13 May 2026, 01:22:21
    Author     : lutri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Error | Glamour Salon</title>
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

            /* Error Card Styles */
            .error-card {
                width: 90%;
                max-width: 500px;
                margin: 80px auto;
                background: #ffffff;
                border: 1px solid #e0d5d5;
                padding: 50px 40px;
                text-align: center;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            }

            /* Error Icon */
            .error-icon {
                font-size: 5rem;
                color: #e74c3c;
                margin-bottom: 20px;
                background-color: rgba(231, 76, 60, 0.1);
                width: 100px;
                height: 100px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-left: auto;
                margin-right: auto;
                font-weight: bold;
            }

            .error-heading {
                color: #e74c3c;
                margin-bottom: 20px;
                font-size: 2rem;
                text-transform: uppercase;
                letter-spacing: 2px;
            }

            .error-message {
                background-color: #fef0ef;
                border-left: 4px solid #e74c3c;
                padding: 15px;
                margin: 20px 0;
            }

            .error-message p {
                color: #e74c3c;
                font-size: 1rem;
                margin: 0;
            }

            .error-card p {
                color: #555;
                margin-bottom: 10px;
            }

            /* Button Group */
            .button-group {
                display: flex;
                gap: 15px;
                justify-content: center;
                margin-top: 30px;
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
                min-width: 140px;
            }

            .btn:hover {
                background-color: #fbcce1;
                color: #1a1a1a;
                transform: translateY(-2px);
            }

            .btn-primary {
                background-color: #1a1a1a;
            }

            .btn-secondary {
                background-color: #e74c3c;
            }

            .btn-secondary:hover {
                background-color: #c0392b;
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
                .error-card {
                    padding: 30px 20px;
                    margin: 50px auto;
                }
                .error-heading {
                    font-size: 1.5rem;
                }
                .error-icon {
                    font-size: 3.5rem;
                    width: 80px;
                    height: 80px;
                }
                .btn {
                    min-width: 120px;
                    padding: 10px 18px;
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
                    <h1>Login Error</h1>
                    <p>Authentication • Failed • Try Again</p>
                </div>
            </div>
        </header>

        <nav>
            <a href="index.html">Home</a>
            <a href="login.jsp">Login Again</a>
        </nav>

        <main>
            <div class="error-card">
                <div class="error-icon">✖</div>
                <h1 class="error-heading">Login Failed</h1>
                
                <div class="error-message">
                    <p>❌ Login details are incorrect (Password/Username)</p>
                </div>
                
                <p>Please check your credentials and try again.</p>
                <p>Contact the salon administrator if you need assistance.</p>
                
                <div class="button-group">
                    <a href="login.jsp" class="btn btn-primary">Try Again</a>
                    <a href="index.html" class="btn btn-secondary">Back to Home</a>
                </div>
            </div>
        </main>

        <footer>
            © 2026 Glamour Salon | Beauty by Lutricia
        </footer>

    </body>
</html>