package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.hospital.model.OPDOrder;
import com.hospital.util.DBConnection;

public class ReceptionOPDDao {
    public void insertOPDPatient(OPDOrder c) throws Exception {
        String sql = "INSERT INTO reception_patient_opd_record (patient_name, patient_age, tolken_no) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, c.getPatientName());
            stmt.setInt(2, c.getPatientAge());
            stmt.setInt(3, c.getTolkenNo());
            stmt.executeUpdate();
        }
    }
}
