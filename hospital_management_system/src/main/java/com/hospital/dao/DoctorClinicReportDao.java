package com.hospital.dao;


import com.hospital.model.Ilness;
import com.hospital.model.PatientReport;
import com.hospital.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DoctorClinicReportDao {

    public ArrayList<PatientReport> getAllReports(int patientid) {
        ArrayList<PatientReport> reportList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM doctor_patient_report_clinic where patient_id =?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, patientid); 
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                int doctor_id = rs.getInt("doctor_id");
                int patient_id = rs.getInt("patient_id");
                Date date = rs.getDate("date");
                Date return_date = rs.getDate("return_date");
                String weight = rs.getString("weight");
                String suger_level = rs.getString("suger_level");
                String bp = rs.getString("bp");
                String lipid_profile = rs.getString("lipid_profile");
                String hemoglobin = rs.getString("hemoglobin");
                String vision = rs.getString("vision");
                String eye_pressure = rs.getString("eye_pressure");
                String vdrl = rs.getString("vdrl");
                String hiv = rs.getString("hiv");

                
                PatientReport patientReport=new PatientReport(order_id,doctor_id,patient_id,date,return_date,
                		weight,suger_level,bp,lipid_profile,hemoglobin,vision,eye_pressure,vdrl,hiv);
                reportList.add(patientReport);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return reportList;
    }

    
    
    public List<Ilness> getIllnessesByPatientId(int patientId) throws ClassNotFoundException {
        List<Ilness> illnessList = new ArrayList<>();
        String sql = "SELECT order_id, patient_id, clinic_id, illness FROM doctor_patient_illness_clinic WHERE patient_id = ?";

        try  {
            Connection con = DBConnection.getConnection();

        	PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, patientId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Ilness illness = new Ilness(
                    rs.getInt("order_id"),
                    rs.getInt("patient_id"),
                    rs.getInt("clinic_id"),
                    rs.getString("illness")
                );
                illnessList.add(illness);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // or use proper logging
        }

        return illnessList;
    }
    
    
}
