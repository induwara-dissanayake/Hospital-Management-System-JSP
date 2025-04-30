package com.hospital.model;

import com.hospital.dao.PatientDAO;
import com.hospital.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Extended Patient class with additional fields and data retrieval methods
 */
public class Patient2 extends Patient {
    
    private String gender;
    private int age;
    private String contactNumber;
    private String address;
    private String bloodGroup;
    private String medicalHistory;
    private Date registrationDate;
    
    /**
     * Default constructor
     */
    public Patient2() {
        super();
    }
    
    /**
     * Constructor with basic patient information
     */
    public Patient2(String name, String nic) {
        super(name, nic);
    }
    
    /**
     * Constructor with ID and basic patient information
     */
    public Patient2(int id, String name, String nic) {
        super(id, name, nic);
    }
    
    /**
     * Full constructor with all fields
     */
    public Patient2(int id, String name, String nic, String gender, int age, 
                   String contactNumber, String address, String bloodGroup, 
                   String medicalHistory, Date registrationDate) {
        super(id, name, nic);
        this.gender = gender;
        this.age = age;
        this.contactNumber = contactNumber;
        this.address = address;
        this.bloodGroup = bloodGroup;
        this.medicalHistory = medicalHistory;
        this.registrationDate = registrationDate;
    }
    
    // Getters and Setters for additional fields
    
    public String getGender() {
        return gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }
    
    public int getAge() {
        return age;
    }
    
    public void setAge(int age) {
        this.age = age;
    }
    
    public String getContactNumber() {
        return contactNumber;
    }
    
    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }
    
    public String getAddress() {
        return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getBloodGroup() {
        return bloodGroup;
    }
    
    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }
    
    public String getMedicalHistory() {
        return medicalHistory;
    }
    
    public void setMedicalHistory(String medicalHistory) {
        this.medicalHistory = medicalHistory;
    }
    
    public Date getRegistrationDate() {
        return registrationDate;
    }
    
    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }
    
    // Data retrieval methods
    
    /**
     * Get all patients with extended information from the database
     * @return List of Patient2 objects
     */
    public static List<Patient2> getAllPatients() {
        List<Patient2> patients = new ArrayList<>();
        String query = "SELECT * FROM patients";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet rs = statement.executeQuery()) {
            
            while (rs.next()) {
                Patient2 patient = new Patient2(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("nic")
                );
                
                // Try to get extended fields if they exist in the database
                try {
                    patient.setGender(rs.getString("gender"));
                    patient.setAge(rs.getInt("age"));
                    patient.setContactNumber(rs.getString("contact_number"));
                    patient.setAddress(rs.getString("address"));
                    patient.setBloodGroup(rs.getString("blood_group"));
                    patient.setMedicalHistory(rs.getString("medical_history"));
                    patient.setRegistrationDate(rs.getDate("registration_date"));
                } catch (SQLException e) {
                    // Ignore if extended fields don't exist
                }
                
                patients.add(patient);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return patients;
    }
    
    /**
     * Get a patient by ID with extended information
     * @param id Patient ID
     * @return Patient2 object or null if not found
     */
    public static Patient2 getPatientById(int id) {
        String query = "SELECT * FROM patients WHERE id = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next()) {
                Patient2 patient = new Patient2(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("nic")
                );
                
                // Try to get extended fields if they exist in the database
                try {
                    patient.setGender(rs.getString("gender"));
                    patient.setAge(rs.getInt("age"));
                    patient.setContactNumber(rs.getString("contact_number"));
                    patient.setAddress(rs.getString("address"));
                    patient.setBloodGroup(rs.getString("blood_group"));
                    patient.setMedicalHistory(rs.getString("medical_history"));
                    patient.setRegistrationDate(rs.getDate("registration_date"));
                } catch (SQLException e) {
                    // Ignore if extended fields don't exist
                }
                
                return patient;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    /**
     * Search patients by name, NIC, or other criteria
     * @param searchTerm The search term
     * @return List of matching Patient2 objects
     */
    public static List<Patient2> searchPatients(String searchTerm) {
        List<Patient2> patients = new ArrayList<>();
        String query = "SELECT * FROM patients WHERE name LIKE ? OR nic LIKE ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setString(1, "%" + searchTerm + "%");
            statement.setString(2, "%" + searchTerm + "%");
            ResultSet rs = statement.executeQuery();
            
            while (rs.next()) {
                Patient2 patient = new Patient2(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("nic")
                );
                
                // Try to get extended fields if they exist in the database
                try {
                    patient.setGender(rs.getString("gender"));
                    patient.setAge(rs.getInt("age"));
                    patient.setContactNumber(rs.getString("contact_number"));
                    patient.setAddress(rs.getString("address"));
                    patient.setBloodGroup(rs.getString("blood_group"));
                    patient.setMedicalHistory(rs.getString("medical_history"));
                    patient.setRegistrationDate(rs.getDate("registration_date"));
                } catch (SQLException e) {
                    // Ignore if extended fields don't exist
                }
                
                patients.add(patient);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return patients;
    }
    
    /**
     * Save or update a patient in the database
     * @return true if successful, false otherwise
     */
    public boolean save() {
        Connection connection = null;
        PreparedStatement statement = null;
        
        try {
            connection = DBConnection.getConnection();
            
            // Check if patient exists
            if (this.getId() > 0) {
                // Update existing patient
                String query = "UPDATE patients SET name = ?, nic = ?, gender = ?, age = ?, " +
                               "contact_number = ?, address = ?, blood_group = ?, " +
                               "medical_history = ?, registration_date = ? WHERE id = ?";
                
                statement = connection.prepareStatement(query);
                statement.setString(1, this.getName());
                statement.setString(2, this.getNic());
                statement.setString(3, this.gender);
                statement.setInt(4, this.age);
                statement.setString(5, this.contactNumber);
                statement.setString(6, this.address);
                statement.setString(7, this.bloodGroup);
                statement.setString(8, this.medicalHistory);
                statement.setDate(9, this.registrationDate);
                statement.setInt(10, this.getId());
                
                return statement.executeUpdate() > 0;
            } else {
                // Insert new patient
                String query = "INSERT INTO patients (name, nic, gender, age, contact_number, " +
                               "address, blood_group, medical_history, registration_date) " +
                               "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                
                statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                statement.setString(1, this.getName());
                statement.setString(2, this.getNic());
                statement.setString(3, this.gender);
                statement.setInt(4, this.age);
                statement.setString(5, this.contactNumber);
                statement.setString(6, this.address);
                statement.setString(7, this.bloodGroup);
                statement.setString(8, this.medicalHistory);
                statement.setDate(9, this.registrationDate);
                
                int affectedRows = statement.executeUpdate();
                
                if (affectedRows > 0) {
                    // Get the generated ID
                    ResultSet generatedKeys = statement.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        this.setId(generatedKeys.getInt(1));
                    }
                    return true;
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return false;
    }
    
    /**
     * Delete a patient from the database
     * @return true if successful, false otherwise
     */
    public boolean delete() {
        if (this.getId() <= 0) {
            return false;
        }
        
        String query = "DELETE FROM patients WHERE id = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, this.getId());
            return statement.executeUpdate() > 0;
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    @Override
    public String toString() {
        return "Patient2 [id=" + getId() + ", name=" + getName() + ", nic=" + getNic() + 
               ", gender=" + gender + ", age=" + age + ", contactNumber=" + contactNumber + 
               ", address=" + address + ", bloodGroup=" + bloodGroup + 
               ", registrationDate=" + registrationDate + "]";
    }
}
