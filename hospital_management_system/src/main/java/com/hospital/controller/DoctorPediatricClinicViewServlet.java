package com.hospital.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.DoctorClinicOrderDao;
import com.hospital.model.Patient;


@WebServlet("/DoctorPediatricClinicViewServlet")
public class DoctorPediatricClinicViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DoctorPediatricClinicViewServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int patientId = Integer.parseInt(request.getParameter("id"));
		DoctorClinicOrderDao dao = new DoctorClinicOrderDao();
		Patient patient = dao.getOrderById(patientId);

        request.setAttribute("pediatricpatient", patient);
        
        
        request.getRequestDispatcher("views/doctor/doctorPediatricClinicDetail.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
