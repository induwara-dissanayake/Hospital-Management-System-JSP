package com.hospital.dao;

import com.hospital.model.ClinicOrder;
import com.hospital.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;

public class DoctorClinicOrderDao {

    public ArrayList<ClinicOrder> getAllClinicOrders() {
        ArrayList<ClinicOrder> patientList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM clinic_order";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                int patient_id = rs.getInt("patient_id");

                ClinicOrder order = new ClinicOrder(id,patient_id);
                patientList.add(order);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return patientList;
    }
}
