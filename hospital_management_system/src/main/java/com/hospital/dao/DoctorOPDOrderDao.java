package com.hospital.dao;

import com.hospital.model.OPDOrder;
import com.hospital.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;

public class DoctorOPDOrderDao {

    public ArrayList<OPDOrder> getAllOpdOrders() {
        ArrayList<OPDOrder> patientList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM reception_patient_opd_record";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int age = rs.getInt("age");

                OPDOrder order = new OPDOrder(id,name, age);
                patientList.add(order);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return patientList;
    }
    
    
    public OPDOrder getOrderById(int id) {
        OPDOrder order = null;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM opd_order WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                order = new OPDOrder();
                order.setId(rs.getInt("id"));
                order.setName(rs.getString("name"));
                order.setAge(rs.getInt("age"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order;
    }

}
