package com.hospital.controller;

import com.hospital.dao.UserDAO;
import com.hospital.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        UserDAO userDAO = new UserDAO();
        User user = userDAO.authenticateUser(username, password);
        
        if (user != null && user.getRoleId() == 1) { // Check if user is admin (role_id = 1)
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRoleName());
            
            // Redirect to admin dashboard
            response.sendRedirect(request.getContextPath() + "/views/admin/adminDashboard.jsp");
        } else {
            // Redirect back to login page with error
            response.sendRedirect(request.getContextPath() + "/views/admin/adminLogin.jsp?error=true");
        }
    }
} 