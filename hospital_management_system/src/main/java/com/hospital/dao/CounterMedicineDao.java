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
                return extractMedicineFromResultSet(rs);
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
                medicines.add(extractMedicineFromResultSet(rs));
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return medicines;
    }

    // Search medicines by name or ID
    public List<CounterMedicine> searchMedicine(String searchTerm) {
        List<CounterMedicine> medicines = new ArrayList<>();
        String query = "SELECT * FROM medicine WHERE medicine_name LIKE ? OR CAST(medicine_id AS CHAR) LIKE ?";

        try (Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {

            String searchPattern = "%" + searchTerm + "%";
            statement.setString(1, searchPattern);
            statement.setString(2, searchPattern);

            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    medicines.add(extractMedicineFromResultSet(rs));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return medicines;
    }

    // Update medicine stock quantity
    public boolean updateMedicineStock(int medicineId, int additionalStock) {
        String query = "UPDATE medicine SET stock_quantity = stock_quantity + ?, updated_at = CURRENT_TIMESTAMP WHERE medicine_id = ?";
        try (Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, additionalStock);
            statement.setInt(2, medicineId);

            return statement.executeUpdate() > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Helper method to extract medicine from ResultSet
    private CounterMedicine extractMedicineFromResultSet(ResultSet rs) throws SQLException {
        CounterMedicine medicine = new CounterMedicine();
        medicine.setMedicineId(rs.getInt("medicine_id"));
        medicine.setMedicineName(rs.getString("medicine_name"));
        medicine.setDosageForm(rs.getString("dosage_form"));
        medicine.setDosageStrength(rs.getString("dosage_strength"));
        medicine.setStockQuantity(rs.getInt("stock_quantity"));
        medicine.setPrescribedFor(rs.getString("prescribed_for"));
        medicine.setCategory(rs.getString("category"));
        medicine.setCreatedAt(rs.getString("created_at"));
        medicine.setUpdatedAt(rs.getString("updated_at"));
        return medicine;
    }
}
