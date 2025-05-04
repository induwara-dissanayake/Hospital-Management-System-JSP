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
	    
		 String patientName = request.getParameter("patientName");
	        String dob = request.getParameter("dob");
	        String gender = request.getParameter("gender");
	        String nic = request.getParameter("nic");
	        String clinicType = request.getParameter("clinicType");
	        String bloodGroup = request.getParameter("bloodGroup");
	        String telephone = request.getParameter("telephone");
	        String address = request.getParameter("address");
	        String guardianName = request.getParameter("guardianName");
	        String guardianTelephone = request.getParameter("guardianTelephone");

	        Clinic clinic = new Clinic();
	        clinic.setPatientName(patientName);
	        clinic.setDob(dob);
	        clinic.setGender(gender);
	        clinic.setNic(nic);
	        clinic.setClinicType(clinicType);
	        clinic.setBlood_group(bloodGroup);
	        clinic.setTelephone(telephone);
	        clinic.setAddress(address);
	        clinic.setGuardian_name(guardianName);
	        clinic.setGuardianTelephone(guardianTelephone);

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