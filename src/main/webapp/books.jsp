<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Book" %>
<html>
<head>
    <title>Books - Bookstore</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(135deg, #fefefe, #f3f6f9);
            margin: 0;
            padding: 0;
        }

        /* Header / Available Books Section */
        h1 {
            text-align: center;
            padding: 25px;
            color: white;
            font-size: 2.4rem;
            background: linear-gradient(120deg, #ff9a9e, #fad0c4);
            margin: 0;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        /* Navigation bar */
        .nav {
            text-align: center;
            padding: 12px;
            background: linear-gradient(120deg, #00b09b, #96c93d); /* fresh green gradient */
            border-bottom: 3px solid #78b73c;
        }

        .nav a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            margin: 0 15px;
            transition: color 0.3s ease;
        }

        .nav a:hover {
            color: #ffefba;
        }

        table {
            width: 85%;
            margin: 25px auto;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        th {
            background: #00b09b;
            color: white;
            padding: 14px;
            font-size: 1rem;
        }

        td {
            padding: 12px;
            text-align: center;
            color: #2d3436;
            font-size: 0.95rem;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f1f3f8;
        }

        .qty-control {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
        }

        .qty-control button {
            background: #6c5ce7;
            border: none;
            color: white;
            padding: 6px 12px;
            cursor: pointer;
            font-size: 14px;
            border-radius: 4px;
            transition: background 0.3s ease;
        }

        .qty-control button:hover {
            background: #4834d4;
        }

        .qty-control input {
            width: 40px;
            text-align: center;
            border: 1px solid #b2bec3;
            padding: 5px;
            border-radius: 4px;
            background: #f8f9fa;
        }

        input[type="submit"] {
            background: #ff7675;
            border: none;
            padding: 6px 14px;
            color: white;
            font-size: 14px;
            cursor: pointer;
            border-radius: 4px;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #d63031;
        }

        p {
            text-align: center;
            color: #636e72;
        }
    </style>

    <script>
        function increaseQty(id) {
            let qtyInput = document.getElementById("qty_" + id);
            qtyInput.value = parseInt(qtyInput.value) + 1;
        }

        function decreaseQty(id) {
            let qtyInput = document.getElementById("qty_" + id);
            let current = parseInt(qtyInput.value);
            if (current > 1) {
                qtyInput.value = current - 1;
            }
        }
    </script>
</head>
<body>
<h1>📚 Available Books</h1>

<div class="nav">
    <a href="home.jsp">Home</a>
    <a href="books">Books</a>
    <a href="cart.jsp">Cart</a>
    <a href="logout">Logout</a>
</div>

<%
    List<Book> books = (List<Book>) request.getAttribute("books");
%>

<% if (books != null && !books.isEmpty()) { %>
    <table>
        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Price (USD)</th>
            <th>Quantity</th>
            <th>Action</th>
        </tr>
        <% int i = 0; for (Book book : books) { %>
            <tr>
                <td><%= book.getTitle() %></td>
                <td><%= book.getAuthor() %></td>
                <td>$<%= String.format("%.2f", book.getPrice()) %></td>
                <td>
                    <div class="qty-control">
                        <button type="button" onclick="decreaseQty(<%= i %>)">-</button>
                        <input type="text" id="qty_<%= i %>" value="1" readonly>
                        <button type="button" onclick="increaseQty(<%= i %>)">+</button>
                    </div>
                </td>
                <td>
                    <form action="books" method="post">
                        <input type="hidden" name="title" value="<%= book.getTitle() %>">
                        <input type="hidden" name="author" value="<%= book.getAuthor() %>">
                        <input type="hidden" name="price" value="<%= book.getPrice() %>">
                        <input type="hidden" id="hiddenQty_<%= i %>" name="quantity" value="1">
                        <input type="submit" value="Add to Cart"
                         onclick="document.getElementById('hiddenQty_<%= i %>').value = document.getElementById('qty_<%= i %>').value;">
                    </form>
                </td>
            </tr>
        <% i++; } %>
    </table>
<% } else { %>
    <p>No books available.</p>
<% } %>

</body>
</html>
