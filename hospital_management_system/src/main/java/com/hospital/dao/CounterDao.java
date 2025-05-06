package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
}
