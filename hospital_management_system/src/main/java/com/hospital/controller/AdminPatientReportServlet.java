package com.hospital.controller;
import com.hospital.dao.PatientReportDAO;
import com.hospital.model.PrintPatient;
import com.hospital.util.DBConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/searchPatient")
public class AdminPatientReportServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchTerm = request.getParameter("searchTerm");
        String searchBy = request.getParameter("searchBy");

        if (searchTerm != null && searchBy != null) {
            try (Connection conn = DBConnection.getConnection()) {
                PatientReportDAO dao = new PatientReportDAO(conn);
                List<PrintPatient> patients = dao.searchPatients(searchTerm, searchBy);
                request.setAttribute("patients", patients);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Database error: " + e.getMessage());
            }
        }

        request.getRequestDispatcher("views/admin/patientReport.jsp").forward(request, response);
    }
}
