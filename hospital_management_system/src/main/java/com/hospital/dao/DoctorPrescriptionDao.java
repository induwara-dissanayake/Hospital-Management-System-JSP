package com.hospital.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.hospital.model.Prescription;
import com.hospital.util.DBConnection;


public class DoctorPrescriptionDao {

	public static List<Prescription> searchPrescriptions(String query) {
        List<Prescription> prescriptions = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT id, prescription FROM doctor_prescription WHERE prescription LIKE ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + query + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String prescription = rs.getString("prescription");
                prescriptions.add(new Prescription(id, prescription));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return prescriptions;
    }
	
	
	public  List<Prescription> getAllPrescriptions() {
        List<Prescription> prescriptions = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM doctor_prescription";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String prescription = rs.getString("prescription");
                prescriptions.add(new Prescription(id, prescription));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return prescriptions;
    }
}
