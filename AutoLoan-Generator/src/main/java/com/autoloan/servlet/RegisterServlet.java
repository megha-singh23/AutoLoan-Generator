package com.autoloan.servlet;

import java.io.IOException;

import com.autoloan.dao.UserDao;
import com.autoloan.dao.impl.UserDaoImpl;
import com.autoloan.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDao userDAO = new UserDaoImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (username == null || email == null || password == null ||
            username.isEmpty() || email.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "Please fill in all fields.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Check if user exists
        if (userDAO.getUserByUsername(username) != null) {
            request.setAttribute("error", "Username already exists.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        try {

            User user = new User();
            user.setUsername(username);
            user.setEmail(email);
            user.setPassword(password);

            userDAO.saveUser(user);

            response.sendRedirect("login.jsp?register=success");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Registration failed. Please try again.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
