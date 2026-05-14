<%-- 
    Document   : register
    Created on : 14 May 2026
    Author     : lutri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account | Glamour Salon</title>
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

            .register-card {
                width: 90%;
                max-width: 500px;
                margin: 60px auto;
                background: #ffffff;
                border: 1px solid #e0d5d5;
                padding: 40px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            }

            .register-card h2 {
                text-align: center;
                text-transform: uppercase;
                letter-spacing: 2px;
                margin-bottom: 30px;
                color: #1a1a1a;
                font-size: 1.8rem;
            }

            .form-group {
                margin-bottom: 20px;
            }

            label {
                font-weight: 600;
                text-transform: uppercase;
                font-size: 0.75rem;
                letter-spacing: 1.5px;
                color: #555;
                display: block;
                margin-bottom: 8px;
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 12px 15px;
                border: 1.5px solid #e0d5d5;
                background-color: #fff;
                font-family: inherit;
                font-size: 1rem;
                outline: none;
                transition: all 0.3s ease;
            }

            input[type="text"]:focus,
            input[type="password"]:focus {
                border-color: #fbcce1;
                box-shadow: 0 0 0 3px rgba(251, 204, 225, 0.2);
            }

            .btn {
                display: inline-block;
                width: 100%;
                background-color: #1a1a1a;
                color: #ffffff;
                padding: 14px 30px;
                text-decoration: none;
                text-transform: uppercase;
                font-size: 0.85rem;
                letter-spacing: 2px;
                font-weight: 700;
                border: none;
                transition: all 0.3s ease;
                cursor: pointer;
                text-align: center;
                margin-top: 10px;
            }

            .btn:hover {
                background-color: #fbcce1;
                color: #1a1a1a;
                transform: translateY(-2px);
            }

            .login-link {
                text-align: center;
                margin-top: 20px;
                padding-top: 20px;
                border-top: 1px solid #eee;
            }

            .login-link a {
                color: #e74c3c;
                text-decoration: none;
                text-transform: uppercase;
                font-size: 0.8rem;
                letter-spacing: 1px;
            }

            .login-link a:hover {
                text-decoration: underline;
            }

            .error-msg {
                background-color: #fef0ef;
                border-left: 4px solid #e74c3c;
                padding: 12px;
                margin-bottom: 20px;
                color: #e74c3c;
                font-size: 0.85rem;
            }

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

            @media (max-width: 600px) {
                .logo { height: 80px; }
                .header-text h1 { font-size: 1.5rem; }
                .register-card { padding: 25px; margin: 40px auto; }
                .register-card h2 { font-size: 1.3rem; }
            }
        </style>
    </head>
    <body>

        <header class="main-header">
            <div class="logo-container">
                <img src="logo.png" alt="Glamour Salon Logo" class="logo">
                <div class="header-text">
                    <h1>Create Account</h1>
                    <p>Join • Glamour • Family</p>
                </div>
            </div>
        </header>

        <nav>
            <a href="index.html">Home</a>
            <a href="login.jsp">Login</a>
            <a href="book.jsp">Book Appointment</a>
        </nav>

        <main>
            <div class="register-card">
                <h2>Register New Account</h2>
                
                <%
                    String error = (String) request.getAttribute("error");
                    if (error != null && !error.isEmpty()) {
                %>
                    <div class="error-msg">
                        ⚠️ <%= error %>
                    </div>
                <%
                    }
                %>
                
                <form action="RegisterServlet.do" method="POST">
                    <div class="form-group">
                        <label>Username</label>
                        <input type="text" name="username" placeholder="Choose a username" required>
                    </div>
                    
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="password" placeholder="Choose a password" required>
                    </div>
                    
                    <div class="form-group">
                        <label>Confirm Password</label>
                        <input type="password" name="confirm_password" placeholder="Confirm your password" required>
                    </div>
                    
                    <input type="submit" value="Create Account" class="btn">
                </form>
                
                <div class="login-link">
                    <a href="login.jsp">Already have an account? Login here →</a>
                </div>
            </div>
        </main>

        <footer>
            © 2026 Glamour Salon | Beauty by Lutricia
        </footer>

    </body>
</html>