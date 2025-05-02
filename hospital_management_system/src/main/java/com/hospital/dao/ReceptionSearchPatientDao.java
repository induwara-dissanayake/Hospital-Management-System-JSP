package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.hospital.model.Patient;
import com.hospital.util.DBConnection;

public class ReceptionSearchPatientDao {

    public List<Patient> searchPatient(String searchInput) {
        List<Patient> patients = new ArrayList<>();

        try {
        	Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM reception_patient_registration WHERE id = ? OR patient_nic = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, searchInput);
            stmt.setString(2, searchInput);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Patient patient = new Patient(
                        rs.getInt("id"),
                        rs.getString("patient_name"),
                        rs.getString("patient_dob"),
                        rs.getString("clinic_id"),
                        rs.getString("patient_address"),
                        rs.getString("patient_nic"),
                        rs.getString("patient_contact_no"),
                        rs.getString("patient_guardian_name"),
                        rs.getString("patient_guardian_contact_no")
                    );
                patients.add(patient);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return patients;
    }
}
