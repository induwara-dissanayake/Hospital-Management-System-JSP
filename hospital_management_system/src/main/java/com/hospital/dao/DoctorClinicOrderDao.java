package com.hospital.dao;

import com.hospital.model.ClinicOrder;
import com.hospital.model.OPDOrder;
import com.hospital.model.Patient;
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
    
    
    public Patient getOrderById(int id) {
        
        Patient patient = null;

        try (Connection con = DBConnection.getConnection()) {
           
                String sqlPatient = "SELECT * FROM patient WHERE id = ?";
                PreparedStatement psPatient = con.prepareStatement(sqlPatient);
                psPatient.setInt(1, id);
                ResultSet rsPatient = psPatient.executeQuery();
              
                if (rsPatient.next()) {
                     patient = new Patient();
                    patient.setId(rsPatient.getInt("id"));
                    patient.setName(rsPatient.getString("name"));
                    patient.setNic(rsPatient.getString("nic"));
                    
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return patient;
    }

    
    
}
