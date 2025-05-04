package com.hospital.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hospital.dao.DoctorClinicReportDao;
import com.hospital.dao.ReceptionSearchPatientDao;
import com.hospital.model.Ilness;
import com.hospital.model.Patient;
import com.hospital.model.PatientReport;


@WebServlet("/DoctorClinicViewServlet")
public class DoctorClinicViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public DoctorClinicViewServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int patientId = Integer.parseInt(request.getParameter("patient_id"));
		int orderId = Integer.parseInt(request.getParameter("order_id"));
		
		HttpSession session = request.getSession();
        session.setAttribute("order_id", orderId);
        session.setAttribute("patient_id", patientId);
        
        
		DoctorClinicReportDao dao = new DoctorClinicReportDao();
		ArrayList<PatientReport> reportList=dao.getAllReports(patientId);
		
		List<Ilness> ilnessList=null;
		try {
			ilnessList=dao.getIllnessesByPatientId(patientId);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		ReceptionSearchPatientDao patientDao = new ReceptionSearchPatientDao();
		
		Patient patient = null;
		try {
			patient = patientDao.getPatientById(patientId);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

        request.setAttribute("patient", patient);
        request.setAttribute("patient_report", reportList);
        request.setAttribute("ilnessList", ilnessList);


        
        request.getRequestDispatcher("views/doctor/doctorClinicDetail.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
