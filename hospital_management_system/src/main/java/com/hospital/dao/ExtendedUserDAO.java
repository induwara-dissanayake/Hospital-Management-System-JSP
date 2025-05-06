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

    // Get all users
    public java.util.List<ExtendedUser> getAllUsers() throws SQLException, ClassNotFoundException {
        java.util.List<ExtendedUser> users = new java.util.ArrayList<>();
        String sql = "SELECT * FROM user_registrations";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             java.sql.ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                ExtendedUser user = new ExtendedUser();
                user.setId(rs.getInt("id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getString("role"));
                user.setSpecialization(rs.getString("specialization"));
                user.setLicenseNumber(rs.getString("license_number"));
                user.setShift(rs.getString("shift"));
                users.add(user);
            }
        }
        return users;
    }

    // Delete user by ID
    public boolean deleteUserById(int id) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM user_registrations WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        }
    }
}
