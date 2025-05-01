package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.hospital.util.DBConnection;

public class AttendanceLogDAO {

    public boolean logLogin(int userId) {
        String sql = "INSERT INTO attendance_log (user_id, login_time) VALUES (?, current_timestamp())";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            return pstmt.executeUpdate() > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean logLogout(int userId) {
        String sql = "UPDATE attendance_log SET logout_time = current_timestamp() " +
                    "WHERE user_id = ? AND logout_time IS NULL";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            return pstmt.executeUpdate() > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
} 