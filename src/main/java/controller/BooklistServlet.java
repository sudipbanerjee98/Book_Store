package controller;

import dao.BookDao;
import model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/books")
public class BooklistServlet extends HttpServlet {
    protected void service (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
     {
        BookDao bookDAO = new BookDao();
        List<Book> books = bookDAO.getAllBooks();
        request.setAttribute("books", books);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
