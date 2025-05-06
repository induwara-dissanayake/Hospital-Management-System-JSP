package com.hospital.dao;

import com.hospital.model.Medicine;
import com.hospital.util.DBConnection;
import java.sql.*;
import java.util.*;

public class MedicineDAO {
    // Get all medicines
    public List<Medicine> getAllMedicines() throws SQLException, ClassNotFoundException {
        List<Medicine> medicines = new ArrayList<>();
        String sql = "SELECT * FROM medicine";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                Medicine med = new Medicine();
                med.setMedicineId(rs.getInt("medicine_id"));
                med.setMedicineName(rs.getString("medicine_name"));
                med.setDosageForm(rs.getString("dosage_form"));
                med.setDosageStrength(rs.getString("dosage_strength"));
                med.setStockQuantity(rs.getInt("stock_quantity"));
                med.setPrescribedFor(rs.getString("prescribed_for"));
                med.setCategory(rs.getString("category"));
                med.setCreatedAt(rs.getString("created_at"));
                med.setUpdatedAt(rs.getString("updated_at"));
                medicines.add(med);
            }
        }
        return medicines;
    }

    // Add a new medicine
    public boolean addMedicine(Medicine medicine) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO medicine (medicine_name, dosage_form, dosage_strength, stock_quantity, prescribed_for, category, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW())";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, medicine.getMedicineName());
            statement.setString(2, medicine.getDosageForm());
            statement.setString(3, medicine.getDosageStrength());
            statement.setInt(4, medicine.getStockQuantity());
            statement.setString(5, medicine.getPrescribedFor());
            statement.setString(6, medicine.getCategory());
            return statement.executeUpdate() > 0;
        }
    }

    // Remove a medicine by ID
    public boolean removeMedicine(int medicineId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM medicine WHERE medicine_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, medicineId);
            return statement.executeUpdate() > 0;
        }
    }
}

