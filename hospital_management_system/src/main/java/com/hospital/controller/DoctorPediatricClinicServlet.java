package com.hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hospital.dao.DoctorClinicOrderDao;
import com.hospital.model.ClinicOrder;

@WebServlet("/DoctorPediatricClinicServlet")
public class DoctorPediatricClinicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DoctorPediatricClinicServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DoctorClinicOrderDao dao = new DoctorClinicOrderDao();
		int clinic_id = Integer.parseInt(request.getParameter("clinic_id"));
		HttpSession session = request.getSession();
        session.setAttribute("clinic_id", clinic_id);
		
		 ArrayList<ClinicOrder> patientList = (ArrayList<ClinicOrder>) dao.getAllPediatricClinicOrders(clinic_id);

	        request.setAttribute("pediatricclinicpatients", patientList);
	        request.getRequestDispatcher("views/doctor/doctorPediatricClinicPatients.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
