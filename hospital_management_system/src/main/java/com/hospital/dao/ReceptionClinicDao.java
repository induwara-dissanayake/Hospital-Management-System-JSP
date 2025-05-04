package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hospital.model.Clinic;
import com.hospital.util.DBConnection;

public class ReceptionClinicDao {

    public void insertClinicPatient(Clinic c) throws Exception {
        Connection conn = DBConnection.getConnection();

        String sql = "INSERT INTO clinic (patient_name, dob, gender, nic, clinic_type, blood_group, telephone, address, guardian_name, guardian_telephone) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        

        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, c.getPatientName());
        stmt.setString(2, c.getDob());
        stmt.setString(3, c.getGender());
        stmt.setString(4, c.getNic());
        stmt.setString(5, c.getClinicType());
        stmt.setString(6, c.getBlood_group());
        stmt.setString(7, c.getTelephone());
        stmt.setString(8, c.getAddress());
        stmt.setString(9, c.getGuardian_name());
        stmt.setString(10, c.getGuardianTelephone());

        stmt.executeUpdate();
        stmt.close();
        conn.close();
    }
}
