package com.hospital.dao;

import com.hospital.model.Medicine;
import com.hospital.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MedicineDAO {

    public void addMedicine(Medicine medicine) throws SQLException, ClassNotFoundException {
        String query = "INSERT INTO medicine (medicine_name, dosage_form, dosage_strength, stock_quantity, prescribed_for, category) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, medicine.getMedicineName());
            preparedStatement.setString(2, medicine.getDosageForm());
            preparedStatement.setString(3, medicine.getDosageStrength());
            preparedStatement.setInt(4, medicine.getStockQuantity());
            preparedStatement.setString(5, medicine.getPrescribedFor());
            preparedStatement.setString(6, medicine.getCategory());
            preparedStatement.executeUpdate();
        }
    }

    public List<Medicine> getAllMedicines() throws SQLException, ClassNotFoundException {
        List<Medicine> medicines = new ArrayList<>();
        String query = "SELECT * FROM medicine";
        try (Connection connection = DBConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                Medicine medicine = new Medicine();
                medicine.setMedicineId(resultSet.getInt("medicine_id"));
                medicine.setMedicineName(resultSet.getString("medicine_name"));
                medicine.setDosageForm(resultSet.getString("dosage_form"));
                medicine.setDosageStrength(resultSet.getString("dosage_strength"));
                medicine.setStockQuantity(resultSet.getInt("stock_quantity"));
                medicine.setPrescribedFor(resultSet.getString("prescribed_for"));
                medicine.setCategory(resultSet.getString("category"));
                medicine.setCreatedAt(resultSet.getString("created_at"));
                medicine.setUpdatedAt(resultSet.getString("updated_at"));
                medicines.add(medicine);
            }
        }
        return medicines;
    }
}