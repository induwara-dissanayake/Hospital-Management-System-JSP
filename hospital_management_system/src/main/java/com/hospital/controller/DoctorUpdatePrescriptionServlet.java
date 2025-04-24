package com.hospital.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.DoctorPrescriptionDao;


@WebServlet("/DoctorUpdatePrescriptionServlet")
public class DoctorUpdatePrescriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DoctorUpdatePrescriptionServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		  int id = Integer.parseInt(request.getParameter("id"));
	        String newName = request.getParameter("name");

	        DoctorPrescriptionDao dao = new DoctorPrescriptionDao();
	        try {
				dao.updatePrescription(id, newName);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	        response.sendRedirect("DoctorAddPrescriptionServlet"); 
	}

	

}
