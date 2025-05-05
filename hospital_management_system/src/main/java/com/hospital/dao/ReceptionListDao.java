package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;

import com.hospital.model.Patient;
import com.hospital.model.ClinicOrder;
import com.hospital.util.DBConnection;

public class ReceptionListDao {

    // Existing methods...

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

    public ClinicOrder insertClinicOrder(ClinicOrder order) throws SQLException, ClassNotFoundException {
        ClinicOrder insertedOrder = null;

        String sql = "INSERT INTO reception_patient_clinic_records (tolken_no, clinic_id, patient_id, date, doctor_complete, counter_complete) " +
                     "VALUES (?, ?, ?, NOW(), 0, 0)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, order.getTolkenNo());
            ps.setInt(2, order.getClinicId());
            ps.setInt(3, order.getPatientId());

            int affectedRows = ps.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Inserting clinic order failed, no rows affected.");
            }

            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int newId = generatedKeys.getInt(1);

                    // Retrieve the inserted record
                    String fetchSql = "SELECT * FROM reception_patient_clinic_records WHERE id = ?";
                    try (PreparedStatement fetchStmt = con.prepareStatement(fetchSql)) {
                        fetchStmt.setInt(1, newId);
                        try (ResultSet rs = fetchStmt.executeQuery()) {
                            if (rs.next()) {
                                insertedOrder = new ClinicOrder(
                                    rs.getInt("id"),
                                    rs.getInt("tolken_no"),
                                    rs.getInt("clinic_id"),
                                    rs.getInt("patient_id"),
                                    rs.getTimestamp("date"),
                                    rs.getInt("doctor_complete"),
                                    rs.getInt("counter_complete")
                                );
                            }
                        }
                    }
                } else {
                    throw new SQLException("Inserting clinic order failed, no ID obtained.");
                }
            }
        }

        return insertedOrder;
    }

    public ClinicOrder getClinicOrderByPatientId(int patientId) throws SQLException, ClassNotFoundException {
        ClinicOrder clinicOrder = null;
        String sql = "SELECT * FROM reception_patient_clinic_records WHERE patient_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, patientId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    clinicOrder = new ClinicOrder(
                        rs.getInt("id"),
                        rs.getInt("tolken_no"),
                        rs.getInt("clinic_id"),
                        rs.getInt("patient_id"),
                        rs.getTimestamp("date"),
                        rs.getInt("doctor_complete"),
                        rs.getInt("counter_complete")
                    );
                }
            }
        }
        return clinicOrder;
    }
    
}
