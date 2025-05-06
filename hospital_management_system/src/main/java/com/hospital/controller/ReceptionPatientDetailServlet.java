package com.hospital.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hospital.dao.ReceptionSearchPatientDao;
import com.hospital.model.Patient;

@WebServlet("/ReceptionPatientDetailServlet")
public class ReceptionPatientDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReceptionSearchPatientDao patientDao;

    public ReceptionPatientDetailServlet() {
        super();
        patientDao = new ReceptionSearchPatientDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get the patient ID from the request parameter
            int patientId = Integer.parseInt(request.getParameter("id"));

            // Retrieve patient details from the database
            Patient patient = patientDao.getPatientById(patientId);

            if (patient != null) {
                // Set the patient object as a request attribute
                request.setAttribute("onepatient", patient);

                // Forward to the detail view page
                request.getRequestDispatcher("/views/reception/receptionPatientSearchResult.jsp").forward(request,
                        response);
            } else {
                // Handle patient not found
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Patient not found");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid patient ID");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving patient details");
        }
    }
}
