package com.hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.DoctorClinicOrderDao;
import com.hospital.model.ClinicOrder;


@WebServlet("/DoctorClinicServlet")
public class DoctorClinicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public DoctorClinicServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DoctorClinicOrderDao dao = new DoctorClinicOrderDao();
		 ArrayList<ClinicOrder> patientList = (ArrayList<ClinicOrder>) dao.getAllClinicOrders();

	        request.setAttribute("clinicpatients", patientList);
	        request.getRequestDispatcher("doctorClinicPatients.jsp").forward(request, response);
		
		
	}
}
