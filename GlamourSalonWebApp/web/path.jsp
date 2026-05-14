<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>GlassFish Path Finder</title>
</head>
<body>
    <h1>GlassFish Installation Detection</h1>
    
    <h2>System Properties:</h2>
    <ul>
        <li>com.sun.aas.instanceRoot: <%= System.getProperty("com.sun.aas.instanceRoot") %></li>
        <li>com.sun.aas.installRoot: <%= System.getProperty("com.sun.aas.installRoot") %></li>
        <li>user.dir: <%= System.getProperty("user.dir") %></li>
    </ul>
    
    <h2>Checking common paths:</h2>
    <ul>
        <%
            String[] paths = {
                "C:/glassfish7/bin/asadmin.bat",
                "C:/glassfish7/glassfish/bin/asadmin.bat",
                "C:/glassfish/bin/asadmin.bat",
                "C:/Program Files/NetBeans-12.0/netbeans/enterprise/glassfish6/bin/asadmin.bat",
                "C:/Program Files/Apache NetBeans-17/netbeans/enterprise/glassfish7/bin/asadmin.bat",
                System.getProperty("com.sun.aas.installRoot") + "/bin/asadmin.bat"
            };
            
            for (String path : paths) {
                if (path != null) {
                    java.io.File f = new java.io.File(path);
                    out.println("<li>" + path + " - " + (f.exists() ? "✅ EXISTS" : "❌ NOT FOUND") + "</li>");
                }
            }
        %>
    </ul>
    
    <h2>Keyfile locations:</h2>
    <ul>
        <%
            String[] keyfilePaths = {
                "C:/glassfish7/glassfish/domains/domain1/config/keyfile",
                "C:/glassfish/glassfish/domains/domain1/config/keyfile",
                "C:/Program Files/NetBeans-12.0/netbeans/enterprise/glassfish6/glassfish/domains/domain1/config/keyfile",
                System.getProperty("com.sun.aas.instanceRoot") + "/config/keyfile"
            };
            
            for (String path : keyfilePaths) {
                if (path != null) {
                    java.io.File f = new java.io.File(path);
                    out.println("<li>" + path + " - " + (f.exists() ? "✅ EXISTS" + (f.canWrite() ? " (WRITABLE)" : " (READ ONLY)") : "❌ NOT FOUND") + "</li>");
                }
            }
        %>
    </ul>
</body>
</html>