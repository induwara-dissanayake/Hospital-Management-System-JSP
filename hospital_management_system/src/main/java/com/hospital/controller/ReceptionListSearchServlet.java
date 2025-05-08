package com.hospital.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hospital.dao.ReceptionListDao;
import com.hospital.model.Patient;

@WebServlet("/ReceptionListSearchServlet")
public class ReceptionListSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReceptionListDao receptionListDao;

    @Override
    public void init() throws ServletException {
        super.init();
        receptionListDao = new ReceptionListDao(); // Initialize once during servlet lifecycle
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Patient> patients = receptionListDao.getAllPatients(); // Get all patients on GET
        request.setAttribute("patients", patients);
        request.getRequestDispatcher("views/reception/receptionPatientListSearch.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nameOrId = request.getParameter("nameorid");
        List<Patient> patients = receptionListDao.searchPatient(nameOrId);

        request.setAttribute("patients", patients);
        request.setAttribute("searchInput", nameOrId);
        request.getRequestDispatcher("views/reception/receptionPatientList.jsp").forward(request, response);
    }
}
