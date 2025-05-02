package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hospital.model.Attendance;
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
    
    
    public List<Attendance> getAttendanceByUserId(int userId) throws SQLException, ClassNotFoundException {
        List<Attendance> attendanceList = new ArrayList<>();
        String sql = "SELECT * FROM attendance_log WHERE user_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
        		PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, userId);
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    Attendance attendance = new Attendance();
                    attendance.setId(rs.getInt("id"));
                    attendance.setUserId(rs.getInt("user_id"));
                    attendance.setLoginTime(rs.getTimestamp("login_time"));
                    attendance.setLogoutTime(rs.getTimestamp("logout_time"));
                    attendance.setStatus(rs.getString("status"));
                    
                    attendanceList.add(attendance);
                }
            }
        }
        
        return attendanceList;
    }
    
} 