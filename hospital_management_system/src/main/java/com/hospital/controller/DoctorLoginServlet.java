package com.hospital.controller;

import com.hospital.dao.DoctorLoginDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DoctorLoginServlet")
public class DoctorLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        DoctorLoginDao dao = new DoctorLoginDao();
        int doctorId = dao.validate(username, password);

        if (doctorId != -1) {

        	HttpSession session = request.getSession();
            session.setAttribute("doctor_id", doctorId);
            session.setAttribute("username", username);

            response.sendRedirect("doctorDashboard.jsp"); 
        } else {

        	response.sendRedirect("doctorLogin.jsp?error=invalid");
        }
    }
}
