package controllers;

import dao.UserDAO;
import daoImpl.UserDAOImpl;
import models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

//@WebServlet({"/", "/login", "/register", "/logout"}) // Matches web.xml
public class AuthController extends HttpServlet {
    private UserDAO userDAO = new UserDAOImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();

        switch (path) {
            case "/register":
                request.getRequestDispatcher("/register.jsp").forward(request, response);
                break;
            case "/logout":
                HttpSession session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
                }
                response.sendRedirect(request.getContextPath() + "/login");
                break;
            case "/login":
            case "/":
            default:
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if ("register".equals(action)) {
            User newUser = new User();
            newUser.setUsername(username);
            newUser.setPassword(password); // Hash password in production
            userDAO.registerUser(newUser);
            response.sendRedirect(request.getContextPath() + "/login");
        } else { // Login action
            User user = userDAO.getUserByUsername(username);
            if (user != null && user.getPassword().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect(request.getContextPath() + "/weather");
            } else {
                request.setAttribute("error", "Invalid credentials");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        }
    }
}