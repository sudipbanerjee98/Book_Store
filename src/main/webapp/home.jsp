<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Book" %>
<%@ page import="model.User" %>
<html>
<head>
    <title>Home - Bookstore</title>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    List<Book> books = (List<Book>) request.getAttribute("books");
%>

<h1>Welcome, <%= (user != null) ? user.getName() : "Guest" %></h1>

<!-- Navigation -->
<a href="profile">Profile</a> |
<a href="cart">Cart</a> |
<a href="logout">Logout</a>

<hr/>

<!-- Search form -->
<form action="search" method="get">
    <input type="text" name="keyword" placeholder="Search by book or author" required/>
    <input type="submit" value="Search"/>
</form>

<h2>Available Books</h2>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Title</th>
        <th>Author</th>
        <th>Price (USD)</th>
        <th>Action</th>
    </tr>

<%
    if (books != null && !books.isEmpty()) {
        for (Book book : books) {
%>
    <tr>
        <td><%= book.getTitle() %></td>
        <td><%= book.getAuthor() %></td>
        <td><%= String.format("%.2f", book.getPrice()) %></td>
        <td>
            <form action="addtocart" method="get" style="margin:0;">
                <input type="hidden" name="id" value="<%= book.getId() %>"/>
                <input type="submit" value="Add to Cart"/>
            </form>
        </td>
    </tr>
<%
        }
    } else {
%>
    <tr>
        <td colspan="4">No books found.</td>
    </tr>
<%
    }
%>
</table>
</body>
</html>
  --%>