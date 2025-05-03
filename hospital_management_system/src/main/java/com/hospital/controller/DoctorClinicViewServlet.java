package com.hospital.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.DoctorClinicReportDao;
import com.hospital.dao.ReceptionSearchPatientDao;
import com.hospital.model.Patient;
import com.hospital.model.PatientReport;


@WebServlet("/DoctorClinicViewServlet")
public class DoctorClinicViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public DoctorClinicViewServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int patientId = Integer.parseInt(request.getParameter("id"));
		
		DoctorClinicReportDao dao = new DoctorClinicReportDao();
		ArrayList<PatientReport> reportList=dao.getAllReports(patientId);
		
		ReceptionSearchPatientDao patientDao = new ReceptionSearchPatientDao();
		
		Patient patient = null;
		try {
			patient = patientDao.getPatientById(patientId);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        request.setAttribute("patient", patient);
        request.setAttribute("patient_report", reportList);

        
        request.getRequestDispatcher("views/doctor/doctorClinicDetail.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
