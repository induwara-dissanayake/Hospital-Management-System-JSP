package com.hospital.controller;

import com.hospital.dao.PatientDAO;
import com.hospital.model.Patient;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/PatientManagementServlet")
public class PatientManagementServlet extends HttpServlet {

    private PatientDAO patientDAO;

    @Override
    public void init() {
        patientDAO = new PatientDAO();
    }

    // Handling patient add request
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String nic = request.getParameter("nic");

        Patient patient = new Patient(name, nic);
        boolean isAdded = patientDAO.addPatient(patient);

        if (isAdded) {
            response.sendRedirect(request.getContextPath() + "/admin/PatientManagementServlet?message=Patient Added Successfully");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/PatientManagementServlet?message=Failed to Add Patient");
        }
    }

    // Handling patient delete request
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String message = request.getParameter("message");
        
        // If action is delete, handle delete operation
        if (action != null && action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean isDeleted = patientDAO.deletePatient(id);

            if (isDeleted) {
                response.sendRedirect(request.getContextPath() + "/admin/PatientManagementServlet?message=Patient Deleted Successfully");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/PatientManagementServlet?message=Failed to Delete Patient");
            }
        } 
        // Otherwise, fetch all patients and forward to JSP
        else {
            List<Patient> patients = patientDAO.getAllPatients();
            request.setAttribute("patients", patients);
            
            // Pass along any messages
            if (message != null && !message.isEmpty()) {
                request.setAttribute("message", message);
            }
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/patientManagement.jsp");
            dispatcher.forward(request, response);
        }
    }
}
