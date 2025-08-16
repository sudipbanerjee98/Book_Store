//package controller;
//
//import model.User;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.*;
//import java.io.IOException;
//
//import dao.UserDao;
//
//@SuppressWarnings("serial")
//@WebServlet("/login")
//public class LoginServlet extends HttpServlet {
//    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        UserDao userDao = new UserDao();
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//
//        User user = userDao.validateUser(email, password);
//        if (user != null) {
//            HttpSession session = request.getSession();
//            session.setAttribute("user", user);
//            response.sendRedirect("books");
////            user.setEmail(email);
////            user.setPassword(password);
////            userDao.save(email,password);
//        } else {
//            request.setAttribute("error", "Invalid email or password");
//            request.getRequestDispatcher("login.jsp").include(request, response);
//        }
//    }
//}
package controller;

import dao.UserDao;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDao userDao = new UserDao();
        User user = userDao.validateUser(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("home.jsp");
        } else {
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
