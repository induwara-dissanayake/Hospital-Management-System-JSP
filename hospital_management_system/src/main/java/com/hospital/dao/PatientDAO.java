package com.hospital.dao;

import com.hospital.model.Patient;
import com.hospital.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PatientDAO {

    // Add a new patient
    public boolean addPatient(Patient patient) {
        String query = "INSERT INTO patients (name, nic) VALUES (?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, patient.getName());
            statement.setString(2, patient.getNic());
            return statement.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete a patient by ID
    public boolean deletePatient(int id) {
        String query = "DELETE FROM patients WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Fetch a patient by ID
    public Patient getPatientById(int id) {
        String query = "SELECT * FROM patients WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new Patient(rs.getInt("id"), rs.getString("name"), rs.getString("nic"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Get all patients
    public List<Patient> getAllPatients() {
        List<Patient> patients = new ArrayList<>();
        String query = "SELECT * FROM patients";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet rs = statement.executeQuery()) {
            
            while (rs.next()) {
                Patient patient = new Patient(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("nic")
                );
                patients.add(patient);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return patients;
    }
}
