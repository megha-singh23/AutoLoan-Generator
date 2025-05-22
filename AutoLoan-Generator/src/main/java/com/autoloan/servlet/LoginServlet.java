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
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDao userDAO = new UserDaoImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        
        
        if (username == null || password == null ||
            username.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "Username and password are required.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        User user = userDAO.getUserByUsername(username);
        System.out.println(user);
        if (user == null) {
            request.setAttribute("error", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        try {
           
            if (password.equals(user.getPassword())) {

                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("applyLoan.jsp");
            } else {
                request.setAttribute("error", "Invalid username or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Login error. Please try again later.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

}
