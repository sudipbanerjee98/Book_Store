<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Book" %>
<html>
<head>
    <title>Cart - Bookstore</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fc;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #1d3557;
            margin: 20px 0;
        }

        nav {
            background: linear-gradient(90deg, #4a90e2, #007bff);
            padding: 12px 0;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.15);
        }

        nav a {
            text-decoration: none;
            margin: 0 15px;
            color: white;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        nav a:hover {
            color: #ffd166;
        }

        table {
            width: 85%;
            margin: 30px auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
            animation: fadeIn 0.6s ease-in-out;
        }

        table th, table td {
            padding: 14px 18px;
            text-align: center;
        }

        table th {
            background-color: #007BFF;
            color: white;
            text-transform: uppercase;
        }

        table tr:nth-child(even) {
            background-color: #f9fbff;
        }

        table tr:hover {
            background-color: #eef5ff;
            transition: background-color 0.3s ease;
        }

        .total-row {
            background-color: #f1f3f8;
            font-weight: bold;
            font-size: 1.1em;
        }

        .checkout-btn {
            display: block;
            width: 220px;
            margin: 25px auto;
            background: linear-gradient(90deg, #28a745, #20c997);
            color: white;
            border: none;
            padding: 14px;
            font-size: 17px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            box-shadow: 0 3px 8px rgba(0,0,0,0.2);
            transition: transform 0.2s ease, background 0.3s ease;
        }

        .checkout-btn:hover {
            transform: scale(1.05);
            background: linear-gradient(90deg, #218838, #17a589);
        }

        .empty-cart {
            text-align: center;
            font-size: 20px;
            color: #6c757d;
            margin-top: 50px;
            font-weight: 500;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(10px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>
<body>
<h1>Your Shopping Cart</h1>

<nav>
    <a href="home.jsp">Home</a>
    <a href="books">Books</a>
    <a href="cart.jsp">Cart</a>
    <a href="logout">Logout</a>
</nav>

<%
    List<Book> cart = (List<Book>) session.getAttribute("cart");
    double total = 0.0;
%>

<% if (cart != null && !cart.isEmpty()) { %>
    <table>
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
                <td style="color: #28a745; font-weight: 600;">$<%= String.format("%.2f", book.getPrice()) %></td>
            </tr>
        <% } %>
        <tr class="total-row">
            <td colspan="2" style="text-align: right;">Total:</td>
            <td style="color: #e63946;">$<%= String.format("%.2f", total) %></td>
        </tr>
    </table>

    <form action="checkout" method="post">
        <input type="submit" value="Proceed to Checkout" class="checkout-btn"/>
    </form>
<% } else { %>
    <p class="empty-cart">Your cart is empty. <a href="books" style="color:#007BFF; text-decoration:none;">Browse Books</a></p>
<% } %>

</body>
</html>
