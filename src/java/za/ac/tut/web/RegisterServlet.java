package za.ac.tut.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {

    // Your actual GlassFish paths from the detection
    private static final String ASADMIN_PATH = "C:\\Users\\Proline\\GlassFish_Server\\glassfish\\bin\\asadmin.bat";
    private static final String KEYFILE_PATH = "C:\\Users\\Proline\\GlassFish_Server\\glassfish\\domains\\domain1\\config\\keyfile";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        // Validation
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        if (password.length() < 4) {
            request.setAttribute("error", "Password must be at least 4 characters!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        if (username.length() < 3) {
            request.setAttribute("error", "Username must be at least 3 characters!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Check if user already exists in keyfile
        if (userExistsInKeyfile(username)) {
            request.setAttribute("error", "Username already exists! Please choose another.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Try to create user using asadmin
        String result = createGlassFishUser(username, password);

        if (result.contains("success")) {
            request.setAttribute("success", "Account created successfully! Please login.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (result.contains("exists")) {
            request.setAttribute("error", "Username already exists! Please choose another.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            // Fallback: Try direct keyfile write if asadmin fails
            if (addUserToKeyfileDirectly(username, password)) {
                request.setAttribute("success", "Account created successfully! Please login.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Registration failed: " + result);
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        }
    }

    private boolean userExistsInKeyfile(String username) {
        File keyfile = new File(KEYFILE_PATH);
        if (!keyfile.exists()) {
            return false;
        }

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(new java.io.FileInputStream(keyfile)))) {
            String line;
            while ((line = reader.readLine()) != null) {
                // Format in keyfile: username:password;group
                if (line.startsWith(username + ":")) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private String createGlassFishUser(String username, String password) {
        try {
            System.out.println("Running asadmin at: " + ASADMIN_PATH);

            ProcessBuilder pb = new ProcessBuilder(
                    ASADMIN_PATH,
                    "create-file-user",
                    "--authrealmname=file",
                    "--groups=USER",
                    "--password=" + password,
                    username
            );

            pb.redirectErrorStream(true);
            Process process = pb.start();

            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            StringBuilder output = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                output.append(line).append("\n");
                System.out.println(line);
            }

            int exitCode = process.waitFor();
            String result = output.toString().toLowerCase();

            System.out.println("Exit code: " + exitCode);
            System.out.println("Result: " + result);

            if (exitCode == 0 && !result.contains("already exists")) {
                return "success";
            } else if (result.contains("already exists")) {
                return "exists";
            } else {
                return "asadmin error: " + result;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return e.getMessage();
        }
    }

    private boolean addUserToKeyfileDirectly(String username, String password) {
        try {
            // Format required by GlassFish file realm
            // username:password;group
            String userEntry = username + ":" + password + ";USER\n";

            // Append to keyfile
            java.nio.file.Files.write(
                    java.nio.file.Paths.get(KEYFILE_PATH),
                    userEntry.getBytes(),
                    java.nio.file.StandardOpenOption.CREATE,
                    java.nio.file.StandardOpenOption.APPEND
            );

            System.out.println("Successfully wrote user to keyfile: " + username);
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
