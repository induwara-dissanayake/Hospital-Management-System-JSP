package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.hospital.model.CounterMedicine;
import com.hospital.util.DBConnection;

public class CounterDao {

    public boolean insertMedicine(CounterMedicine medicine) {
        String sql = "INSERT INTO medicine (medicine_name, dosage_form, dosage_strength, stock_quantity, prescribed_for, category, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW())";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, medicine.getMedicineName());
            ps.setString(2, medicine.getDosageForm());
            ps.setString(3, medicine.getDosageStrength());
            ps.setInt(4, medicine.getStockQuantity());
            ps.setString(5, medicine.getPrescribedFor());
            ps.setString(6, medicine.getCategory());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateMedicineStock(String medicineName, int quantity, int days, int routine) {
        String sql = "UPDATE medicine SET stock_quantity = stock_quantity - ? WHERE medicine_name = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            // Calculate total quantity to subtract
            int totalQuantity = quantity * days * getRoutineMultiplier(routine);

            ps.setInt(1, totalQuantity);
            ps.setString(2, medicineName);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private int getRoutineMultiplier(int routine) {
        switch (routine) {
            case 1: // Morning
            case 2: // Day
            case 3: // Night
                return 1;
            case 4: // Morning/Day
            case 5: // Morning/Night
            case 6: // Day/Night
                return 2;
            case 7: // Morning/Day/Night
                return 3;
            default:
                return 1;
        }
    }

    public boolean updateOPDCounterComplete(int orderId) {
        String sql = "UPDATE reception_patient_opd_record SET counter_complete = 1 WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateClinicCounterComplete(int orderId) {
        String sql = "UPDATE reception_patient_clinic_records SET counter_complete = 1 WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
