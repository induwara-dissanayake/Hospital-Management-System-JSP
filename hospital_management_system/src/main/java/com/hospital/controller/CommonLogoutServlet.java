package com.hospital.controller;

import com.hospital.dao.AttendanceLogDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/CommonLogoutServlet")
public class CommonLogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Log the logout time
            Integer userId = (Integer) session.getAttribute("userId");
            if (userId != null) {
                AttendanceLogDAO attendanceDAO = new AttendanceLogDAO();
                attendanceDAO.logLogout(userId);
            }
            
            // Invalidate the session
            session.invalidate();
        }

        // Redirect to login page
        response.sendRedirect("login.jsp");
    }
}