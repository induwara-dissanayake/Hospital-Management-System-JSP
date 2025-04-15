package com.hospital.dao;

import java.sql.*;
import com.hospital.util.DBConnection;

public class DoctorLoginDao {

    public int validate(String username, String password) {
        int doctorId = -1;

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT doctor_id FROM doctor_login WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password); 

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                doctorId = rs.getInt("doctor_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return doctorId;
    }
}
