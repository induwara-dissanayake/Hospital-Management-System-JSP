package com.hospital.dao;

import com.hospital.model.ExtendedUser;
import com.hospital.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ExtendedUserDAO {

    public boolean registerUser(ExtendedUser user) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO user_registrations (first_name, last_name, email, phone, address, role, specialization, license_number, shift) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPhone());
            stmt.setString(5, user.getAddress());
            stmt.setString(6, user.getRole());
            stmt.setString(7, user.getSpecialization());
            stmt.setString(8, user.getLicenseNumber());
            stmt.setString(9, user.getShift());

            return stmt.executeUpdate() > 0;
        }
    }
}
