package com.hospital.dao;


import com.hospital.model.PatientReport;
import com.hospital.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;

public class DoctorClinicReportDao {

    public ArrayList<PatientReport> getAllReports() {
        ArrayList<PatientReport> reportList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM doctor_patient_report_clinic";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                int doctor_id = rs.getInt("doctor_id");
                int patient_id = rs.getInt("patient_id");
                Date date = rs.getDate("date");
                String weight = rs.getString("weight");
                String suger_level = rs.getString("suger_level");
                String bp = rs.getString("bp");
                String lipid_profile = rs.getString("lipid_profile");
                String hemoglobin = rs.getString("hemoglobin");
                String vision = rs.getString("vision");
                String eye_pressure = rs.getString("eye_pressure");
                String vdrl = rs.getString("vdrl");
                String hiv = rs.getString("hiv");

                
                PatientReport patientReport=new PatientReport();
                reportList.add(patientReport);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return reportList;
    }

    
    
}
