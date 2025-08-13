package controller;

import model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.BookDao;

@SuppressWarnings("serial")
@WebServlet("/addtocart")
public class AddToCartServlet extends HttpServlet {
    BookDao bookDAO = new BookDao();
    
    @SuppressWarnings("unchecked")
	protected void service(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("id"));
        Book book = bookDAO.getBookById(bookId);

        HttpSession session = request.getSession();
        List<Book> cart = (List<Book>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }
        boolean alreadyInCart = cart.stream().anyMatch(b -> b.getId() == book.getId());
        if (!alreadyInCart) {
            cart.add(book);
        }
        session.setAttribute("cart", cart);
        response.sendRedirect("cart");
    }
}
