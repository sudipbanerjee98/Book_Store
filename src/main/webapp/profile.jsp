<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile - Bookstore</title>
</head>
<body>
<h1>Your Profile</h1>
<a href="books">Back to Books</a> | 
<a href="cart">Cart</a> | 
<a href="logout">Logout</a>
<hr/>
<table border="0" cellpadding="5" cellspacing="0">
    <tr>
        <td><b>Name:</b></td>
        <td>${user.name}</td>
    </tr>
    <tr>
        <td><b>Email:</b></td>
        <td>${user.email}</td>
    </tr>
</table>
</body>
</html>
 --%>