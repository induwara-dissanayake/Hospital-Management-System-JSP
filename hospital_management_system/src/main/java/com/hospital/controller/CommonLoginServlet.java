package com.hospital.controller;

import com.hospital.dao.UserDAO;
import com.hospital.dao.AttendanceLogDAO;
import com.hospital.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CommonLoginServlet")
public class CommonLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            UserDAO userDAO = new UserDAO();
            User user = userDAO.authenticateUser(username, password);

            if (user != null) {
                // Create session and set attributes
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("userId", user.getId());

                // Log attendance
                AttendanceLogDAO attendanceDAO = new AttendanceLogDAO();
                attendanceDAO.logLogin(user.getId());

                // Redirect based on role
                String redirectPath = "";
              


                switch(user.getRoleId()) {
                    case 1: // Admin
                        redirectPath = "/views/admin/adminDashboard.jsp";
                        session.setAttribute("role", "Admin");
                        break;
                    case 2: // Doctor
                        redirectPath = "/views/doctor/doctorDashboard.jsp";
                        session.setAttribute("role", "Doctor");
                        break;
                    case 3: // Receptionist
                        redirectPath = "/views/receptionist/receptionDashboard.jsp";
                        session.setAttribute("role", "Receptionist");
                        break;
                    case 4: // Medical Counter
                        redirectPath = "/views/counter/medicalDashboard.jsp";
                        session.setAttribute("role", "Medical");
                        break;
                    default:
                        throw new ServletException("Invalid role ID");
                }

                response.sendRedirect(request.getContextPath() + redirectPath);
            } else {
            	  String role = request.getParameter("role"); 
                  String loginPage = "/views/" + role + "/" + role + "Login.jsp";
                request.setAttribute("error", "Invalid username or password");
                request.getRequestDispatcher(loginPage).forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "System error occurred. Please try again later.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            e.printStackTrace();
        }
    }
}