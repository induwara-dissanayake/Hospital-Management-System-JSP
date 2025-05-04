package com.hospital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.ReceptionSearchPatientDao;
import com.hospital.model.Patient;

@WebServlet("/ReceptionPatientSearchServlet")
public class ReceptionPatientSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReceptionSearchPatientDao receptionSearchPatientDao;

    public ReceptionPatientSearchServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ReceptionSearchPatientDao dao = new ReceptionSearchPatientDao();
        // Pass empty string or null to get all patients
        List<Patient> patients = dao.getAllPatients();
        request.setAttribute("patients", patients);
        request.getRequestDispatcher("views/reception/receptionPatientrecordsearch.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        receptionSearchPatientDao = new ReceptionSearchPatientDao();

        String nameOrId = request.getParameter("nameorid");
        List<Patient> patients = receptionSearchPatientDao.searchPatient(nameOrId);

        request.setAttribute("patients", patients);
        request.setAttribute("searchInput", nameOrId);

        request.getRequestDispatcher("views/reception/receptionPatientSearchResult.jsp").forward(request, response);
    }

}
