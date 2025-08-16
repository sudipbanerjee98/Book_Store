////package controller;
////
////
////import jakarta.servlet.ServletException;
////import jakarta.servlet.annotation.WebServlet;
////import jakarta.servlet.http.*;
////        import model.Book;
////
////import java.io.IOException;
////import java.util.ArrayList;
////import java.util.List;
////
////@WebServlet("/books")
////public class BooksServlet extends HttpServlet {
////
////    private List<Book> bookList;
////
////    @Override
////    public void init() throws ServletException {
////        super.init();
////        // Sample books (later can be from DB)
////        bookList = new ArrayList<>();
////        bookList.add(new Book("Java Basics", "James Gosling", 29.99));
////        bookList.add(new Book("Spring Boot in Action", "Craig Walls", 39.99));
////        bookList.add(new Book("Hibernate Mastery", "Gavin King", 34.50));
////    }
////
////    @Override
////    protected void doGet(HttpServletRequest request, HttpServletResponse response)
////            throws ServletException, IOException {
////
////        request.setAttribute("books", bookList);
////        request.getRequestDispatcher("/books.jsp").forward(request, response);
////    }
////
////    @Override
////    protected void doPost(HttpServletRequest request, HttpServletResponse response)
////            throws ServletException, IOException {
////
////        String title = request.getParameter("title");
////        String author = request.getParameter("author");
////        double price = Double.parseDouble(request.getParameter("price"));
////
////        HttpSession session = request.getSession();
////        List<Book> cart = (List<Book>) session.getAttribute("cart");
////
////        if (cart == null) {
////            cart = new ArrayList<>();
////        }
////
////        cart.add(new Book(title, author, price));
////        session.setAttribute("cart", cart);
////
////        response.sendRedirect("cart.jsp");
////    }
////}
//package controller;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.*;
//import model.Book;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//
//@WebServlet("/books")
//public class BooksServlet extends HttpServlet {
//
//    private List<Book> bookList;
//
//    @Override
//    public void init() throws ServletException {
//        super.init();
//        // Sample books (later can be from DB)
//        bookList = new ArrayList<>();
//        bookList.add(new Book("Java Basics", "James Gosling", 29.99, 1));
//        bookList.add(new Book("Spring Boot in Action", "Craig Walls", 39.99, 1));
//        bookList.add(new Book("Hibernate Mastery", "Gavin King", 34.50, 1));
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        request.setAttribute("books", bookList);
//        request.getRequestDispatcher("/books.jsp").forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String title = request.getParameter("title");
//        String author = request.getParameter("author");
//        double price = Double.parseDouble(request.getParameter("price"));
//        String action = request.getParameter("action"); // add, increment, decrement
//
//        HttpSession session = request.getSession();
//        List<Book> cart = (List<Book>) session.getAttribute("cart");
//
//        if (cart == null) {
//            cart = new ArrayList<>();
//        }
//
//        // Find book in cart
//        Book existingBook = null;
//        for (Book b : cart) {
//            if (b.getTitle().equals(title) && b.getAuthor().equals(author)) {
//                existingBook = b;
//                break;
//            }
//        }
//
//        if (existingBook == null) {
//            // Add as new item if not found
//            cart.add(new Book(title, author, price, 1));
//        } else {
//            // Update quantity
//            if ("increment".equals(action)) {
//                existingBook.setQuantity(existingBook.getQuantity() + 1);
//            } else if ("decrement".equals(action)) {
//                existingBook.setQuantity(existingBook.getQuantity() - 1);
//                if (existingBook.getQuantity() <= 0) {
//                    cart.remove(existingBook);
//                }
//            }
//        }
//
//        session.setAttribute("cart", cart);
//
//        response.sendRedirect("cart.jsp");
//    }
//}
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Book;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/books")
public class BooksServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Load books into application scope only once
        List<Book> bookList = (List<Book>) getServletContext().getAttribute("bookList");
        if (bookList == null) {
            bookList = new ArrayList<>();
            bookList.add(new Book("Java Basics", "James Gosling", 29.99, 1));
            bookList.add(new Book("Spring Boot in Action", "Craig Walls", 39.99, 1));
            bookList.add(new Book("Hibernate Mastery", "Gavin King", 34.50, 1));
            getServletContext().setAttribute("bookList", bookList);
        }

        String method = request.getMethod();

        if ("GET".equalsIgnoreCase(method)) {
            // Show available books
            request.setAttribute("books", bookList);
            request.getRequestDispatcher("/books.jsp").forward(request, response);

        } else if ("POST".equalsIgnoreCase(method)) {
            // Handle cart actions
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            double price = Double.parseDouble(request.getParameter("price"));
            String action = request.getParameter("action"); // add, increment, decrement

            HttpSession session = request.getSession();
            List<Book> cart = (List<Book>) session.getAttribute("cart");

            if (cart == null) {
                cart = new ArrayList<>();
            }

            // Find existing book in cart
            Book existingBook = null;
            for (Book b : cart) {
                if (b.getTitle().equals(title) && b.getAuthor().equals(author)) {
                    existingBook = b;
                    break;
                }
            }

            if (existingBook == null) {
                // Add new book to cart
                cart.add(new Book(title, author, price, 1));
            } else {
                // Update quantity
                if ("increment".equals(action)) {
                    existingBook.setQuantity(existingBook.getQuantity() + 1);
                } else if ("decrement".equals(action)) {
                    existingBook.setQuantity(existingBook.getQuantity() - 1);
                    if (existingBook.getQuantity() <= 0) {
                        cart.remove(existingBook);
                    }
                }
            }

            session.setAttribute("cart", cart);

            response.sendRedirect("cart.jsp");
        }
    }
}
