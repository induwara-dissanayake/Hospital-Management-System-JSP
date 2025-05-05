package com.hospital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.ReceptionListDao;
import com.hospital.model.Patient;

@WebServlet("/ReceptionListSearchServlet")
public class ReceptionListSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReceptionListDao receptionSearchPatientDao;

    

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ReceptionListDao dao = new ReceptionListDao();
        // Pass empty string or null to get all patients
        List<Patient> patients = dao.getAllPatients();
        request.setAttribute("patients", patients);
        request.getRequestDispatcher("views/reception/receptionPatientListSearch.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        receptionSearchPatientDao = new ReceptionListDao();

        String nameOrId = request.getParameter("nameorid");
        List<Patient> patients = receptionSearchPatientDao.searchPatient(nameOrId);

        request.setAttribute("patients", patients);
        request.setAttribute("searchInput", nameOrId);

        request.getRequestDispatcher("views/reception/receptionPatientList.jsp").forward(request, response);
    }

}