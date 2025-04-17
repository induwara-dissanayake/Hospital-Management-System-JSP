package com.hospital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.DoctorAttendanceDao;
import com.hospital.model.DoctorAttendance;


@WebServlet("/DoctorAttendanceServlet")
public class DoctorAttendanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DoctorAttendanceServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 DoctorAttendanceDao dao = new DoctorAttendanceDao();
	        List<DoctorAttendance> attendanceList = dao.getAllAttendances();

	        request.setAttribute("attendanceList", attendanceList);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("views/doctor/doctorAttendance.jsp");
	        dispatcher.forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
