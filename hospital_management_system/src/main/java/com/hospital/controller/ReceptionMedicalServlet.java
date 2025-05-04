package com.hospital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.hospital.dao.ReceptionMedicalRecordDao;
import com.hospital.model.PatientReport;

@WebServlet("/ReceptionMedicalServlet")
public class ReceptionMedicalServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String query = request.getParameter("query");
            ReceptionMedicalRecordDao dao = new ReceptionMedicalRecordDao();
            List<PatientReport> patientReports;

            if (query == null || query.trim().isEmpty()) {
                patientReports = dao.getAllReports();
            } else {
                patientReports = dao.searchReports(query);
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            Gson gson = new GsonBuilder()
                .setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES)
                .create();

            gson.toJson(patientReports, response.getWriter());

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Error fetching data\"}");
        }
    }

}
