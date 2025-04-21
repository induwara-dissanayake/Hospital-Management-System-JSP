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

@WebServlet("/DoctorGynecologyClinicServlet")
public class DoctorGynecologyClinicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DoctorGynecologyClinicServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DoctorClinicOrderDao dao = new DoctorClinicOrderDao();
		HttpSession session = request.getSession();
		int clinic_id =(int) session.getAttribute("clinic_id");
		
		 ArrayList<ClinicOrder> patientList = (ArrayList<ClinicOrder>) dao.getAllGynecologyClinicOrders(clinic_id);

	        request.setAttribute("gynecologyclinicpatients", patientList);
	        request.getRequestDispatcher("views/doctor/doctorGynecologyClinicPatients.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
