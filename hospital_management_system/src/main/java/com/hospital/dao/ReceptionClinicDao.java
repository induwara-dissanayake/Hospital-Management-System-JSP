package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hospital.model.Clinic;
import com.hospital.util.DBConnection;

public class ReceptionClinicDao {

	public void insertClinicPatient(Clinic c) throws Exception {
	    String sql = "INSERT INTO reception_patient_registration (patient_name, patient_dob, gender, patient_nic, clinic_id, blood_type, patient_contact_no, patient_address, "
	               + "patient_guardian_name, patient_guardian_contact_no) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	    	stmt.setString(1, c.getPatient_name());
	    	stmt.setString(2, c.getPatient_dob());
	    	stmt.setString(3, c.getGender());
	    	stmt.setString(4, c.getPatient_nic());
	    	stmt.setString(5, c.getClinic_id());
	    	stmt.setString(6, c.getBlood_type());
	    	stmt.setString(7, c.getPatient_contact_no());
	    	stmt.setString(8, c.getPatient_address());
	    	stmt.setString(9, c.getPatient_guardian_name());
	    	stmt.setString(10, c.getPatient_guardian_contact_no());

	        stmt.executeUpdate();
	    }
	}
}
