 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login - Bookstore</title>
</head>
<body>
<h1>Welcome to Bookstore - Login</h1>

<form action="login" method="post">
    <label>Email:</label><br/>
    <input type="email" name="email" required/><br/><br/>

    <label>Password:</label><br/>
    <input type="password" name="password" required/><br/><br/>

    <input type="submit" value="Login"/>
</form>

<%
    String error = (String) request.getAttribute("error");
    if (error != null && !error.isEmpty()) {
%>
    <p style="color:red;"><%= error %></p>
<%
    }
%>

</body>
</html>
 