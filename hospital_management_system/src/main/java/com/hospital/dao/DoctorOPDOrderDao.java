package com.hospital.dao;

import com.hospital.model.OPDOrder;
import com.hospital.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;

public class DoctorOPDOrderDao {

    public ArrayList<OPDOrder> getAllOpdOrders() {
        ArrayList<OPDOrder> patientList = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM reception_patient_opd_record";  
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OPDOrder order = new OPDOrder();
                order.setId(rs.getInt("id"));
                order.setPatientName(rs.getString("patient_name"));
                order.setPatientAge(rs.getInt("patient_age"));
                order.setTolkenNo(rs.getInt("tolken_no"));
                order.setDoctorComplete(rs.getInt("doctor_complete"));
                order.setCounterComplete(rs.getInt("counter_complete"));
                patientList.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return patientList;
    }

    public OPDOrder getOrderById(int id) {
        OPDOrder order = null;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM reception_patient_opd_record WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                order = new OPDOrder();
                order.setId(rs.getInt("id"));
                order.setPatientName(rs.getString("patient_name"));
                order.setPatientAge(rs.getInt("patient_age"));
                order.setTolkenNo(rs.getInt("tolken_no"));
                order.setDoctorComplete(rs.getInt("doctor_complete"));
                order.setCounterComplete(rs.getInt("counter_complete"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order;
    }
}
