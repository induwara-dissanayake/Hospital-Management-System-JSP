package com.hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.CounterAssignMedicineDao;
import com.hospital.model.ClinicOrder;
import com.hospital.model.OPDOrder;


@WebServlet("/CounterAssignMedicineServlet")
public class CounterAssignMedicineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CounterAssignMedicineServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CounterAssignMedicineDao opd_dao = new CounterAssignMedicineDao();
		ArrayList<OPDOrder> patientListopd = (ArrayList<OPDOrder>) opd_dao.getAllOpdOrders();
		request.setAttribute("opdpatients", patientListopd);
		
		
		CounterAssignMedicineDao clinic_dao = new CounterAssignMedicineDao();
		ArrayList<ClinicOrder> patientListclinic = (ArrayList<ClinicOrder>) clinic_dao.getAllClinicOrders();
		request.setAttribute("clinicpatients", patientListclinic);
		
		
        request.getRequestDispatcher("views/counter/CounterAssignMedicine.jsp").forward(request, response);

		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
