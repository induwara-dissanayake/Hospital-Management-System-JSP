package com.hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.DoctorPrescriptionDao;
import com.hospital.model.Prescription;

@WebServlet("/DoctorAddPrescriptionServlet")
public class DoctorAddPrescriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DoctorAddPrescriptionServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DoctorPrescriptionDao dao=new DoctorPrescriptionDao();
		 ArrayList<Prescription> prescriptionList = (ArrayList<Prescription>) dao.getAllPrescriptions();

		 request.setAttribute("prescription", prescriptionList);
	     request.getRequestDispatcher("views/doctor/doctorAddPrescriptions.jsp").forward(request, response);
		 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String prescriptionName = request.getParameter("prescriptionName");
	        if (prescriptionName != null && !prescriptionName.trim().isEmpty()) {
	            DoctorPrescriptionDao dao = new DoctorPrescriptionDao();
	            try {
					dao.insertPrescription(prescriptionName.trim());
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
	        }
	        response.sendRedirect("DoctorAddPrescriptionServlet"); 
	}

}
