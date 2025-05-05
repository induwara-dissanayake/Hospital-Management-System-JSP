package com.hospital.dao;

import java.sql.*;
import java.util.*;
import com.hospital.model.Medicine;

public class MedicineDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/hospital";
    private String jdbcUsername = "root";
    private String jdbcPassword = ""; // adjust if needed

    private static final String SELECT_ALL = "SELECT * FROM medicine";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public List<Medicine> selectAllMedicines() {
        List<Medicine> medicines = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL);
             ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {
                Medicine med = new Medicine();
                med.setMedicineName(rs.getString("medicine_name"));
                med.setQuantity(rs.getInt("stock_available"));
                med.setDosage(rs.getString("dosage"));
                med.setPrescribedFor(rs.getString("prescribed_for"));

                medicines.add(med);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return medicines;
    }
}

