package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hospital.model.PatientReport;
import com.hospital.util.DBConnection;

public class ReceptionMedicalRecordDao {

    public List<PatientReport> searchReports(String searchInput) {
        List<PatientReport> reports = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement stmt;

            if (searchInput == null || searchInput.trim().isEmpty()) {
                return getAllReports();
            }

            String sql = "SELECT * FROM doctor_patient_report_clinic WHERE CAST(patient_id AS CHAR) LIKE ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + searchInput + "%");

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                reports.add(createReportFromResultSet(rs));
            }

            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return reports;
    }

    public List<PatientReport> getAllReports() {
        List<PatientReport> reports = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM doctor_patient_report_clinic";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                reports.add(createReportFromResultSet(rs));
            }

            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return reports;
    }

    private PatientReport createReportFromResultSet(ResultSet rs) throws SQLException {
        return new PatientReport(
                rs.getInt("order_id"),
                rs.getInt("doctor_id"),
                rs.getInt("patient_id"),
                rs.getInt("clinic_id"),
                rs.getDate("date"),
                rs.getDate("return_date"),
                rs.getString("weight"),
                rs.getString("sugar_level"),
                rs.getString("bp"),
                rs.getString("lipid_profile"),
                rs.getString("hemoglobin"),
                rs.getString("vision"),
                rs.getString("eye_pressure"),
                rs.getString("vdrl"),
                rs.getString("hiv"));
    }

    public List<PatientReport> getPatientReportById(int patientId) throws SQLException, ClassNotFoundException {
        List<PatientReport> reports = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM doctor_patient_report_clinic WHERE patient_id = ? ORDER BY date DESC";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, patientId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    reports.add(new PatientReport(
                            rs.getInt("order_id"),
                            rs.getInt("doctor_id"),
                            rs.getInt("patient_id"),
                            rs.getInt("clinic_id"),
                            rs.getDate("date"),
                            rs.getDate("return_date"),
                            rs.getString("weight"),
                            rs.getString("sugar_level"),
                            rs.getString("bp"),
                            rs.getString("lipid_profile"),
                            rs.getString("hemoglobin"),
                            rs.getString("vision"),
                            rs.getString("eye_pressure"),
                            rs.getString("vdrl"),
                            rs.getString("hiv")));
                }
            }
        }

        return reports;
    }

}
