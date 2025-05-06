package com.hospital.controller;

import com.hospital.dao.ExtendedUserDAO;
import com.hospital.model.ExtendedUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/userManagementServlet")
public class userManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String removeId = request.getParameter("remove");
        if (removeId != null) {
            try {
                int id = Integer.parseInt(removeId);
                ExtendedUserDAO dao = new ExtendedUserDAO();
                dao.deleteUserById(id);
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect("userManagementServlet");
            return;
        }
        try {
            ExtendedUserDAO dao = new ExtendedUserDAO();
            List<ExtendedUser> users = dao.getAllUsers();
            request.setAttribute("users", users);
            request.getRequestDispatcher("views/admin/userManagement.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading users");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String removeId = request.getParameter("removeId");
        if (removeId != null) {
            try {
                int id = Integer.parseInt(removeId);
                ExtendedUserDAO dao = new ExtendedUserDAO();
                dao.deleteUserById(id);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("userManagementServlet");
    }
}
