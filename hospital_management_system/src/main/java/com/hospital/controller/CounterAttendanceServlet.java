package com.hospital.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hospital.dao.AttendanceLogDAO;
import com.hospital.model.Attendance;




@WebServlet("/CounterAttendanceServlet")
public class CounterAttendanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public CounterAttendanceServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			HttpSession session = request.getSession();
			int userId=(int) session.getAttribute("userId");
		
		 AttendanceLogDAO dao = new AttendanceLogDAO();
	        List<Attendance> attendanceList = null;
			try {
				attendanceList = dao.getAttendanceByUserId(userId);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}

	        request.setAttribute("attendanceList", attendanceList);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("views/counter/CounterAttendance.jsp");
	        dispatcher.forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
