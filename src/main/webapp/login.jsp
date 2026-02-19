<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

<div class="container">
    <h2>Login</h2>

    <% if (request.getParameter("error") != null) { %>
        <p class="error">Invalid Email or Password!</p>
    <% } %>

    <form action="LoginServlet" method="post">
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="password" name="password" placeholder="Enter Password" required>
        <button type="submit">Login</button>
    </form>

    <a href="register.jsp">Create Account</a>
</div>

</body>
</html>
