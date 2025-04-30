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
                String type = rs.getString("type");

                prescriptions.add(new Prescription(id, prescription,type));
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
                String type = rs.getString("type");

                prescriptions.add(new Prescription(id, prescription,type));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return prescriptions;
    }
	
	  public void deletePrescription(int id) throws ClassNotFoundException {
	        String sql = "DELETE FROM doctor_prescription WHERE id = ?";
	        try (Connection con = DBConnection.getConnection()){
	             PreparedStatement stmt = con.prepareStatement(sql);
	            stmt.setInt(1, id);
	            stmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace(); 
	        }
	    }

	    public void updatePrescription(int id, String newName) throws ClassNotFoundException {
	        String sql = "UPDATE doctor_prescription SET prescription = ? WHERE id = ?";
	        try (Connection con = DBConnection.getConnection()){
	             PreparedStatement stmt = con.prepareStatement(sql);
	            stmt.setString(1, newName);
	            stmt.setInt(2, id);
	            stmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    
	    public void insertPrescription(String name, String type) throws ClassNotFoundException {
	        String sql = "INSERT INTO doctor_prescription (prescription, type) VALUES (?, ?)";
	        
	        try (Connection con = DBConnection.getConnection();
	             PreparedStatement stmt = con.prepareStatement(sql)) {
	            
	            stmt.setString(1, name);
	            stmt.setString(2, type);
	            stmt.executeUpdate();
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }


}
