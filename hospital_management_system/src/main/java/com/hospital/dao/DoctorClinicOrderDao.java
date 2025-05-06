package com.hospital.dao;

import com.hospital.model.ClinicOrder;
import com.hospital.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;

public class DoctorClinicOrderDao {

    private ClinicOrder mapResultSetToClinicOrder(ResultSet rs) throws SQLException {
        ClinicOrder order = new ClinicOrder();
        order.setId(rs.getInt("id"));
        order.setTolkenNo(rs.getInt("tolken_no"));
        order.setClinicId(rs.getInt("clinic_id"));
        order.setPatientId(rs.getInt("patient_id"));
        order.setDate(rs.getTimestamp("date"));
        order.setDoctorComplete(rs.getInt("doctor_complete"));
        order.setCounterComplete(rs.getInt("counter_complete"));
        return order;
    }

    public ArrayList<ClinicOrder> getAllClinicOrders() {
        ArrayList<ClinicOrder> orderList = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM reception_patient_clinic_records";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ClinicOrder order = mapResultSetToClinicOrder(rs);
                orderList.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderList;
    }

    public ArrayList<ClinicOrder> getAllClinicOrdersByClinicId(int clinic_id) {
        ArrayList<ClinicOrder> orderList = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM reception_patient_clinic_records WHERE clinic_id = ? AND doctor_complete=0";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, clinic_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ClinicOrder order = mapResultSetToClinicOrder(rs);
                orderList.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderList;
    }

    

}
