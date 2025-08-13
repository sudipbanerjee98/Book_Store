<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Book" %> 
<html>
<head>
    <title>Cart - Bookstore</title>
</head>
<body>
<h1>Your Shopping Cart</h1>

<a href="books">Back to Books</a> | 
<a href="profile">Profile</a> | 
<a href="logout">Logout</a>

<hr/>

<%
    List<Book> cart = (List<Book>) session.getAttribute("cart");
    double total = 0.0;
%>

<% if (cart != null && !cart.isEmpty()) { %>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Price (USD)</th>
        </tr>
        <% for (Book book : cart) {
            total += book.getPrice();
        %>
            <tr>
                <td><%= book.getTitle() %></td>
                <td><%= book.getAuthor() %></td>
                <td><%= String.format("%.2f", book.getPrice()) %></td>
            </tr>
        <% } %>
        <tr>
            <td colspan="2" style="text-align: right;"><strong>Total:</strong></td>
            <td><strong><%= String.format("%.2f", total) %></strong></td>
        </tr>
    </table>
    <br/>
    <form action="checkout" method="post">
        <input type="submit" value="Checkout"/>
    </form>
<% } else { %>
    <p>Your cart is empty.</p>
<% } %>

</body>
</html>
  --%>