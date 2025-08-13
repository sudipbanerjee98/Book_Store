 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register - Bookstore</title>
</head>
<body>
<h1>Create a New Account</h1>
<form action="register" method="post">
    <label>Name:</label><br/>
    <input type="text" name="name" required/><br/><br/>
    <label>Email:</label><br/>
    <input type="email" name="email" required/><br/><br/>
    <label>Password:</label><br/>
    <input type="password" name="password" required/><br/><br/>
    <label>Confirm Password:</label><br/>
    <input type="password" name="confirmPassword" required/><br/><br/>

    <input type="submit" value="Register"/>
</form>
<br/>
<%
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null && !errorMessage.isEmpty()) {
%>
    <p style="color:red;"><%= errorMessage %></p>
<%
    }
%>
<p>Already have an account? <a href="login.jsp">Login here</a></p>
</body>
</html>
 