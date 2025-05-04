package com.hospital.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.ReceptionClinicDao;
import com.hospital.model.Clinic;

@WebServlet("/ReceptionClinicServlet")
public class ReceptionClinicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    String patient_name = request.getParameter("patientName");
	    String patient_dob = request.getParameter("dob");
	    String gender = request.getParameter("gender");
	    String patient_nic = request.getParameter("nic");
	    String clinic_id = request.getParameter("clinicType");
	    String blood_type = request.getParameter("bloodGroup");
	    String patient_contact_no = request.getParameter("telephone");
	    String patient_address = request.getParameter("address");
	    String patient_guardian_name = request.getParameter("guardianName");
	    String patient_guardian_contact_no = request.getParameter("guardianTelephone");

	    Clinic clinic = new Clinic();
	    clinic.setPatient_name(patient_name);
	    clinic.setPatient_dob(patient_dob);
	    clinic.setGender(gender);
	    clinic.setPatient_nic(patient_nic);
	    clinic.setClinic_id(clinic_id);
	    clinic.setBlood_type(blood_type);
	    clinic.setPatient_contact_no(patient_contact_no);
	    clinic.setPatient_address(patient_address);
	    clinic.setPatient_guardian_name(patient_guardian_name);
	    clinic.setPatient_guardian_contact_no(patient_guardian_contact_no);

	    ReceptionClinicDao dao = new ReceptionClinicDao();
	    try {
	        dao.insertClinicPatient(clinic);
	        request.setAttribute("message", "Patient registered successfully!");
	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("message", "Registration failed!");
	    }

	    request.getRequestDispatcher("views/reception/receptionRegistrationsuccess.jsp").forward(request, response);
	}
}
