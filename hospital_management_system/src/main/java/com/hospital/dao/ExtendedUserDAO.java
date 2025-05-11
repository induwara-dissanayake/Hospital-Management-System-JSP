package com.hospital.dao;

import com.hospital.model.ExtendedUser;
import com.hospital.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ExtendedUserDAO {

    // Register a new user
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

    // Get all users from the database
    public List<ExtendedUser> getAllUsers() throws SQLException, ClassNotFoundException {
        List<ExtendedUser> users = new ArrayList<>();
        String sql = "SELECT * FROM user_registrations";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

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

    // Delete a user by their ID
    public boolean deleteUserById(int id) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM user_registrations WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;  // returns true if the delete was successful
        }
    }

    // Get a user by their ID (if needed)
    public ExtendedUser getUserById(int id) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM user_registrations WHERE id = ?";
        ExtendedUser user = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new ExtendedUser();
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
            }
        }
        return user;
    }

    // Update user information (if needed)
    public boolean updateUser(ExtendedUser user) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE user_registrations SET first_name = ?, last_name = ?, email = ?, phone = ?, address = ?, role = ?, specialization = ?, license_number = ?, shift = ? WHERE id = ?";

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
            stmt.setInt(10, user.getId());

            return stmt.executeUpdate() > 0;
        }
    }
}
