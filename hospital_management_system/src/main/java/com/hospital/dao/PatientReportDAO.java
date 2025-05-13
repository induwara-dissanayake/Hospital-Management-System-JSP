package com.hospital.dao;

import com.hospital.model.PrintPatient;
import java.sql.*;
import java.util.*;

public class PatientReportDAO {
    private final Connection conn;

    public PatientReportDAO(Connection conn) {
        this.conn = conn;
    }

    public List<PrintPatient> searchPatients(String searchTerm, String searchBy) throws SQLException {
        List<PrintPatient> list = new ArrayList<>();
        String query = "";

        switch (searchBy) {
            case "nic":
                query = "SELECT * FROM patients WHERE nic LIKE ?";
                break;
            case "id":
                query = "SELECT * FROM patients WHERE id = ?";
                break;
            case "name":
                query = "SELECT * FROM patients WHERE name LIKE ?";
                break;
            default:
                return list; // Empty if invalid option
        }

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            if ("id".equals(searchBy)) {
                stmt.setInt(1, Integer.parseInt(searchTerm));
            } else {
                stmt.setString(1, "%" + searchTerm + "%");
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                PrintPatient p = new PrintPatient();
                p.setId(rs.getInt("id"));
                p.setNic(rs.getString("nic"));
                p.setName(rs.getString("name"));
                p.setAge(rs.getInt("age"));
                p.setGender(rs.getString("gender"));
                p.setDiagnosis(rs.getString("diagnosis"));
                p.setAddress(rs.getString("address"));
                p.setContact(rs.getString("contact"));
                p.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(p);
            }
        }

        return list;
    }
}
