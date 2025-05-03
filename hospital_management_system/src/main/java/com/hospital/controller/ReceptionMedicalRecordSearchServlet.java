package com.hospital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.ReceptionMedicalRecordDao;
import com.hospital.model.PatientReport;

@WebServlet("/ReceptionMedicalRecordSearchServlet")
public class ReceptionMedicalRecordSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReceptionMedicalRecordDao receptionMedicalRecordDao;

    public ReceptionMedicalRecordSearchServlet() {
        super();        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	ReceptionMedicalRecordDao receptionMedicalRecordDao = new ReceptionMedicalRecordDao();
    	
        List<PatientReport> patientReports = receptionMedicalRecordDao.getAllReports();
        request.setAttribute("patientReports", patientReports);
        request.getRequestDispatcher("views/reception/receptionPatientMedicalRecordSearch.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        String searchField = request.getParameter("searchField");
        List<PatientReport> patientReports = receptionMedicalRecordDao.searchReports(searchField);

        request.setAttribute("patientReports", patientReports);
        request.setAttribute("searchInput", searchField);

        request.getRequestDispatcher("views/reception/receptionPatientMedicalRecord.jsp").forward(request, response);
    }
}
