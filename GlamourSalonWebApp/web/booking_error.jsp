<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Error</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<div class="card">

    <div class="icon-error">✖</div>

    <h2>Booking Failed</h2>

    <p>We could not complete your booking.</p>

    <div class="error-box">
        ${error}
    </div>

    <a href="book.jsp" class="btn btn-primary">Try Again</a>
    <a href="index.html" class="btn btn-dark">Home</a>

</div>

</body>
</html>