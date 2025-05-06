package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hospital.model.Patient;
import com.hospital.util.DBConnection;

public class ReceptionSearchPatientDao {
    public List<Patient> searchPatient(String searchInput) {
        List<Patient> patients = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String sql;
            PreparedStatement stmt;
            
            if (searchInput == null || searchInput.trim().isEmpty()) {
                return getAllPatients();
            }

            sql = "SELECT * FROM reception_patient_registration WHERE CAST(id AS CHAR) LIKE ? OR patient_nic LIKE ?";
            stmt = conn.prepareStatement(sql);
            String searchPattern = "%" + searchInput + "%";
            stmt.setString(1, searchPattern);
            stmt.setString(2, searchPattern);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                patients.add(createPatientFromResultSet(rs));
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return patients;
    }

    public List<Patient> getAllPatients() {
        List<Patient> patients = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM reception_patient_registration";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                patients.add(createPatientFromResultSet(rs));
            }
            
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return patients;
    }

    private Patient createPatientFromResultSet(ResultSet rs) throws SQLException {
        return new Patient(
            rs.getInt("id"),
            rs.getString("patient_name"),
            rs.getString("patient_dob"),
            rs.getString("clinic_id"),
            rs.getString("gender"),
            rs.getString("blood_type"),
            rs.getString("patient_address"),
            rs.getString("patient_nic"),
            rs.getString("patient_contact_no"),
            rs.getString("patient_guardian_name"),
            rs.getString("patient_guardian_contact_no")
        );
    }
    
    
    public Patient getPatientById(int id) throws SQLException, ClassNotFoundException {
        Patient patient = null;

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM reception_patient_registration WHERE id = ?";
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);



            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                	patient = new Patient(
                		    rs.getInt("id"),
                		    rs.getString("patient_name"),   
                		    rs.getString("patient_dob"),    
                		    rs.getString("clinic_id"),
                            rs.getString("gender"),
                            rs.getString("blood_type"),
                		    rs.getString("patient_address"),
                		    rs.getString("patient_nic"),   
                		    rs.getString("patient_contact_no"),
                		    rs.getString("patient_guardian_name"), 
                		    rs.getString("patient_guardian_contact_no") 
                		);

                }
            }
        }
        return patient;
    }
}