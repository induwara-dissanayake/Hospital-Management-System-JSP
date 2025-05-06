package com.hospital.dao;

import com.hospital.model.Ilness;
import com.hospital.model.PatientReport;
import com.hospital.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DoctorClinicReportDao {

    public ArrayList<PatientReport> getAllReports(int patientid) {
        ArrayList<PatientReport> reportList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM doctor_patient_report_clinic where patient_id =?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, patientid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                int doctor_id = rs.getInt("doctor_id");
                int patient_id = rs.getInt("patient_id");
                int clinic_id = rs.getInt("clinic_id");
                Date date = rs.getDate("date");
                Date return_date = rs.getDate("return_date");
                String weight = rs.getString("weight");
                String suger_level = rs.getString("sugar_level");
                String bp = rs.getString("bp");
                String lipid_profile = rs.getString("lipid_profile");
                String hemoglobin = rs.getString("hemoglobin");
                String vision = rs.getString("vision");
                String eye_pressure = rs.getString("eye_pressure");
                String vdrl = rs.getString("vdrl");
                String hiv = rs.getString("hiv");

                PatientReport patientReport = new PatientReport(order_id, doctor_id, patient_id, clinic_id, date,
                        return_date,
                        weight, suger_level, bp, lipid_profile, hemoglobin, vision, eye_pressure, vdrl, hiv);
                reportList.add(patientReport);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return reportList;
    }

    public List<Ilness> getIllnessesByPatientId(int patientId) throws ClassNotFoundException {
        List<Ilness> illnessList = new ArrayList<>();
        String sql = "SELECT order_id, patient_id, clinic_id, illness FROM doctor_patient_illness_clinic WHERE patient_id = ?";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, patientId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Ilness illness = new Ilness(
                        rs.getInt("order_id"),
                        rs.getInt("patient_id"),
                        rs.getInt("clinic_id"),
                        rs.getString("illness"));
                illnessList.add(illness);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return illnessList;
    }

    public boolean saveClinicReport(int orderId, int doctorId, int patientId, int clinicId,
            String weight, String sugarLevel, String bp, String lipidProfile,
            String hemoglobin, String vision, String eyePressure, String vdrl,
            String hiv, Date returnDate) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "INSERT INTO doctor_patient_report_clinic (order_id, doctor_id, patient_id, clinic_id, " +
                "date, return_date, weight, sugar_level, bp, lipid_profile, hemoglobin, vision, " +
                "eye_pressure, vdrl, hiv) VALUES (?, ?, ?, ?, CURDATE(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ps.setInt(2, doctorId);
            ps.setInt(3, patientId);
            ps.setInt(4, clinicId);
            ps.setDate(5, returnDate);
            ps.setString(6, weight);
            ps.setString(7, sugarLevel);
            ps.setString(8, bp);
            ps.setString(9, lipidProfile);
            ps.setString(10, hemoglobin);
            ps.setString(11, vision);
            ps.setString(12, eyePressure);
            ps.setString(13, vdrl);
            ps.setString(14, hiv);

            return ps.executeUpdate() > 0;
        }
    }

    public boolean saveIllnesses(int orderId, int patientId, int clinicId, List<String> illnesses)
            throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "INSERT INTO doctor_patient_illness_clinic (order_id, patient_id, clinic_id, illness) VALUES (?, ?, ?, ?)";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            for (String illness : illnesses) {
                ps.setInt(1, orderId);
                ps.setInt(2, patientId);
                ps.setInt(3, clinicId);
                ps.setString(4, illness);
                ps.addBatch();
            }
            int[] results = ps.executeBatch();
            return results.length > 0;
        }
    }

    public boolean savePrescriptions(int orderId, int doctorId, int patientId, int clinicId,
            List<Integer> prescriptionIds, List<String> routines, List<Integer> quantities,
            List<Integer> days) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "INSERT INTO doctor_patient_prescription_clinic (order_id, doctor_id, patient_id, " +
                "clinic_id, prescription_id, routine, qty, days) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            for (int i = 0; i < prescriptionIds.size(); i++) {
                ps.setInt(1, orderId);
                ps.setInt(2, doctorId);
                ps.setInt(3, patientId);
                ps.setInt(4, clinicId);
                ps.setInt(5, prescriptionIds.get(i));
                ps.setString(6, routines.get(i));
                ps.setInt(7, quantities.get(i));
                ps.setInt(8, days.get(i));
                ps.addBatch();
            }
            int[] results = ps.executeBatch();
            return results.length > 0;
        }
    }

    public boolean updateClinicRecordStatus(int orderId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE reception_patient_clinic_records SET doctor_complete = 1 WHERE id = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            return ps.executeUpdate() > 0;
        }
    }

    public Integer getNextPatientId(int clinicId, int currentOrderId) {
        String sql = "SELECT patient_id FROM reception_patient_clinic_records WHERE clinic_id = ? AND doctor_complete = 0 AND id > ? ORDER BY id ASC LIMIT 1";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, clinicId);
            stmt.setInt(2, currentOrderId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("patient_id");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Integer getOrderIdForPatient(Integer patientId, int clinicId) {
        String sql = "SELECT id as order_id FROM reception_patient_clinic_records WHERE patient_id = ? AND clinic_id = ? AND doctor_complete = 0 LIMIT 1";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, patientId);
            stmt.setInt(2, clinicId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("order_id");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
