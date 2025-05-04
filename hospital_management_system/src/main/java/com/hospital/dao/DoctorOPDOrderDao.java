package com.hospital.dao;

import com.hospital.model.OPDOrder;
import com.hospital.model.OPDIlness;
import com.hospital.model.OPDPrescription;
import com.hospital.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DoctorOPDOrderDao {

    public ArrayList<OPDOrder> getAllOpdOrders() {
        ArrayList<OPDOrder> patientList = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM reception_patient_opd_record where doctor_complete =0";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OPDOrder order = new OPDOrder();
                order.setId(rs.getInt("id"));
                order.setPatientName(rs.getString("patient_name"));
                order.setPatientAge(rs.getInt("patient_age"));
                order.setTolkenNo(rs.getInt("tolken_no"));
                order.setDoctorComplete(rs.getInt("doctor_complete"));
                order.setCounterComplete(rs.getInt("counter_complete"));
                patientList.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return patientList;
    }

    public OPDOrder getOrderById(int id) {
        OPDOrder order = null;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM reception_patient_opd_record WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                order = new OPDOrder();
                order.setId(rs.getInt("id"));
                order.setPatientName(rs.getString("patient_name"));
                order.setPatientAge(rs.getInt("patient_age"));
                order.setTolkenNo(rs.getInt("tolken_no"));
                order.setDoctorComplete(rs.getInt("doctor_complete"));
                order.setCounterComplete(rs.getInt("counter_complete"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order;
    }

    public OPDOrder getNextOrder(int currentOrderId) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM reception_patient_opd_record WHERE doctor_complete = 0 AND id > ? ORDER BY id ASC LIMIT 1";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, currentOrderId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                OPDOrder order = new OPDOrder();
                order.setId(rs.getInt("id"));
                order.setPatientName(rs.getString("patient_name"));
                order.setPatientAge(rs.getInt("patient_age"));
                order.setTolkenNo(rs.getInt("tolken_no"));
                order.setDoctorComplete(rs.getInt("doctor_complete"));
                order.setCounterComplete(rs.getInt("counter_complete"));
                return order;
            }

            // If no next order found, get the first uncompleted order
            sql = "SELECT * FROM reception_patient_opd_record WHERE doctor_complete = 0 ORDER BY id ASC LIMIT 1";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                OPDOrder order = new OPDOrder();
                order.setId(rs.getInt("id"));
                order.setPatientName(rs.getString("patient_name"));
                order.setPatientAge(rs.getInt("patient_age"));
                order.setTolkenNo(rs.getInt("tolken_no"));
                order.setDoctorComplete(rs.getInt("doctor_complete"));
                order.setCounterComplete(rs.getInt("counter_complete"));
                return order;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean saveOPDOrderDetails(int orderId, List<OPDIlness> illnesses, List<OPDPrescription> prescriptions) {
        Connection con = null;
        try {
            con = DBConnection.getConnection();
            con.setAutoCommit(false); // Start transaction

            // Save illnesses
            String deleteIllnessSql = "DELETE FROM doctor_patient_illness_opd WHERE order_id = ?";
            String insertIllnessSql = "INSERT INTO doctor_patient_illness_opd (order_id, illness) VALUES (?, ?)";

            try (PreparedStatement deleteStmt = con.prepareStatement(deleteIllnessSql)) {
                deleteStmt.setInt(1, orderId);
                deleteStmt.executeUpdate();
            }

            try (PreparedStatement insertStmt = con.prepareStatement(insertIllnessSql)) {
                for (OPDIlness illness : illnesses) {
                    insertStmt.setInt(1, illness.getOrder_id());
                    insertStmt.setString(2, illness.getIlnessString());
                    insertStmt.addBatch();
                }
                insertStmt.executeBatch();
            }

            // Save prescriptions
            String deletePrescriptionSql = "DELETE FROM doctor_patient_prescription_opd WHERE order_id = ?";
            String insertPrescriptionSql = "INSERT INTO doctor_patient_prescription_opd (order_id, doctor_id, prescription_id, routine, qty, days) VALUES (?, ?, ?, ?, ?, ?)";

            try (PreparedStatement deleteStmt = con.prepareStatement(deletePrescriptionSql)) {
                deleteStmt.setInt(1, orderId);
                deleteStmt.executeUpdate();
            }

            try (PreparedStatement insertStmt = con.prepareStatement(insertPrescriptionSql)) {
                for (OPDPrescription prescription : prescriptions) {
                    insertStmt.setInt(1, prescription.getOrderId());
                    insertStmt.setInt(2, prescription.getDoctorId());
                    insertStmt.setInt(3, prescription.getPrescriptionId());
                    insertStmt.setInt(4, prescription.getRoutine());
                    insertStmt.setInt(5, prescription.getQty());
                    insertStmt.setInt(6, prescription.getDays());
                    insertStmt.addBatch();
                }
                insertStmt.executeBatch();
            }

            // Update doctor_complete status
            String updateOrderSql = "UPDATE reception_patient_opd_record SET doctor_complete = 1 WHERE id = ?";
            try (PreparedStatement updateStmt = con.prepareStatement(updateOrderSql)) {
                updateStmt.setInt(1, orderId);
                updateStmt.executeUpdate();
            }

            con.commit(); // Commit transaction
            return true;

        } catch (Exception e) {
            try {
                if (con != null) {
                    con.rollback(); // Rollback on error
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (con != null) {
                    con.setAutoCommit(true); // Reset auto-commit
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
