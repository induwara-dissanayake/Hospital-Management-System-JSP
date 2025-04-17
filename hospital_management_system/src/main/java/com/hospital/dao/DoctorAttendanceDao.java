package com.hospital.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.hospital.model.DoctorAttendance;
import com.hospital.util.DBConnection;

public class DoctorAttendanceDao {

    	public List<DoctorAttendance> getAllAttendances() {
            List<DoctorAttendance> list = new ArrayList<>();

            try (Connection con = DBConnection.getConnection()) {
                String sql = "SELECT doctor_id, time FROM doctor_attendance ORDER BY time DESC";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    DoctorAttendance da = new DoctorAttendance();
                    da.setDoctorId(rs.getInt("doctor_id"));
                    da.setTime(rs.getTimestamp("time"));
                    list.add(da);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return list;
        }
}
