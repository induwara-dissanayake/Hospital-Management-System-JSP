package com.hospital.controller;

import com.hospital.dao.ReceptionMedicalRecordDao;
import com.hospital.model.PatientReport;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ReceptionMedicalDetailServlet")
public class ReceptionMedicalDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String patientParam = request.getParameter("patient_id");

        // Debug log
        System.out.println("Received patient_id: " + patientParam);

        if (patientParam == null || patientParam.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing patient ID");
            return;
        }

        int patientId;
        try {
            patientId = Integer.parseInt(patientParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Patient ID must be a valid number");
            return;
        }

        ReceptionMedicalRecordDao dao = new ReceptionMedicalRecordDao();
        PatientReport report;
        try {
            report = dao.getPatientReportById(patientId);
            if (report == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Patient report not found for ID: " + patientId);
                return;
            }

            request.setAttribute("report", report);
            request.getRequestDispatcher("receptionMedicalDetails.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Server error occurred");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

