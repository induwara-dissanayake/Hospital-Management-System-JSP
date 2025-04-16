package com.hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.DoctorOPDOrderDao;
import com.hospital.model.OPDOrder;


@WebServlet("/DoctorOPDServlet")
public class DoctorOPDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public DoctorOPDServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 DoctorOPDOrderDao dao = new DoctorOPDOrderDao();
		 ArrayList<OPDOrder> patientList = (ArrayList<OPDOrder>) dao.getAllOpdOrders();

	        request.setAttribute("opdpatients", patientList);
	        request.getRequestDispatcher("views/doctor/doctorOpdPatients.jsp").forward(request, response);
		
		
	}
}
