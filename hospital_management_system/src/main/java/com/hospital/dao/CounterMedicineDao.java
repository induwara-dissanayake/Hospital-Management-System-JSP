  package com.hospital.dao;

import com.hospital.model.CounterMedicine;
import com.hospital.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CounterMedicineDao {

    // Add a new medicine
    public boolean addMedicine(CounterMedicine medicine) {
        String query = "INSERT INTO medicine (medicine_name, stock_availability, dosage, prescribed_for) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, medicine.getMedicineName());
            statement.setInt(2, medicine.getStockAvailability());
            statement.setString(3, medicine.getDosage());
            statement.setString(4, medicine.getPrescribedFor());

            return statement.executeUpdate() > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete a medicine by ID
    public boolean deleteMedicine(int medicineId) {
        String query = "DELETE FROM medicine WHERE medicine_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, medicineId);
            return statement.executeUpdate() > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get a medicine by ID
    public CounterMedicine getMedicineById(int medicineId) {
        String query = "SELECT * FROM medicine WHERE medicine_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, medicineId);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                return new CounterMedicine(
                    rs.getInt("medicine_id"),
                    rs.getString("medicine_name"),
                    rs.getInt("stock_availability"),
                    rs.getString("dosage"),
                    rs.getString("prescribed_for")
                );
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get all medicines
    public List<CounterMedicine> getAllMedicines() {
        List<CounterMedicine> medicines = new ArrayList<>();
        String query = "SELECT * FROM medicine";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {
                CounterMedicine medicine = new CounterMedicine(
                    rs.getInt("medicine_id"),
                    rs.getString("medicine_name"),
                    rs.getInt("stock_availability"),
                    rs.getString("dosage"),
                    rs.getString("prescribed_for")
                );
                medicines.add(medicine);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return medicines;
    }
}
