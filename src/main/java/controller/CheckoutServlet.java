package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@SuppressWarnings("serial")
@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        session.removeAttribute("cart");
        request.setAttribute("message", "Payment Successful! Thank you for your purchase.");
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }
}
