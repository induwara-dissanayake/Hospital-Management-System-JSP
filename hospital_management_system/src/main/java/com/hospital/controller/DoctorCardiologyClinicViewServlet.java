package com.hospital.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.DoctorClinicOrderDao;
import com.hospital.model.Patient;


@WebServlet("/DoctorCardiologyClinicViewServlet")
public class DoctorCardiologyClinicViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DoctorCardiologyClinicViewServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int patientId = Integer.parseInt(request.getParameter("id"));
		DoctorClinicOrderDao dao = new DoctorClinicOrderDao();
		Patient patient = dao.getOrderById(patientId);

        request.setAttribute("cardiologypatient", patient);
        
        
        request.getRequestDispatcher("views/doctor/doctorCardiologyClinicDetail.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
