package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Basic validation
        if (name == null || email == null || password == null || confirmPassword == null ||
            name.isEmpty() || email.isEmpty() || password.isEmpty() || confirmPassword.isEmpty()) {

            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Password and Confirm Password do not match.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // TODO: Add more validations like email format, password strength, etc.

        // TODO: Add code to save user details into database here
        // Example (pseudo-code):
        // User user = new User(name, email, password);
        // UserDao userDao = new UserDao();
        // boolean success = userDao.registerUser(user);

        // For now, simulate success
        boolean success = true;

        if (success) {
            // Redirect to login page or home page on successful registration
            response.sendRedirect("login.jsp");
        } else {
            // On failure, forward back to register page with error message
            request.setAttribute("errorMessage", "Registration failed. Please try again.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    // You can override doGet as well if you want to serve the registration page from servlet
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
    
}

