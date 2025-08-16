<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Book" %>
<%@ page import="model.User" %>
<html>
<head>
    <title>Home - Bookstore</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background: linear-gradient(135deg, #f7e8d5, #d6f6ff);
            color: #333;
        }

        header {
            background: linear-gradient(90deg, #ff914d, #ff4d6d);
            color: white;
            padding: 15px 0;
            text-align: center;
            font-size: 1.8rem;
            box-shadow: 0 2px 5px rgba(0,0,0,0.15);
        }

        nav {
            background: rgba(0, 0, 0, 0.8);
            padding: 10px;
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 15px;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        nav a:hover {
            background: #ff914d;
            color: #fff;
        }

        main {
            max-width: 800px;
            margin: 40px auto;
            background: rgba(255, 255, 255, 0.9);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.15);
        }

        form {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        input[type="text"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            flex: 1;
            font-size: 1rem;
            outline: none;
        }

        input[type="text"]:focus {
            border-color: #ff914d;
            box-shadow: 0 0 5px rgba(255, 145, 77, 0.4);
        }

        input[type="submit"] {
            background: #ff914d;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            transition: 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #ff4d6d;
            transform: scale(1.05);
        }

        .welcome {
            text-align: center;
            font-size: 1.3rem;
            color: #444;
        }
    </style>
</head>
<body>

<header>
    📚 Online Bookstore
</header>

<%
    User user = (User) session.getAttribute("user");
    List<Book> books = (List<Book>) request.getAttribute("books");
%>

<nav>
    <a href="books">Books</a>
    <a href="cart.jsp">Cart</a>
    <a href="logout">Logout</a>
</nav>

<main>
    <p class="welcome">Welcome, <strong><%= (user != null) ? user.getName() : "Guest" %></strong>!</p>

    <form action="search" method="get">
        <input type="text" name="keyword" placeholder="Search by book or author" required/>
        <input type="submit" value="Search"/>
    </form>
</main>

</body>
</html>
