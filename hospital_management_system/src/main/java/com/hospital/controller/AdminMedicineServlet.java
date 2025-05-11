package com.hospital.controller;

import com.hospital.dao.MedicineDAO;
import com.hospital.model.Medicine;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/MedicineServlet")
public class AdminMedicineServlet extends HttpServlet {

    private MedicineDAO medicineDAO;

    @Override
    public void init() throws ServletException {
        medicineDAO = new MedicineDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("addMedicine".equals(action)) {
            addMedicine(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("removeMedicine".equals(action)) {
            removeMedicine(request, response);
        } else {
            try {
                List<Medicine> medicines = medicineDAO.getAllMedicines();
                request.setAttribute("medicines", medicines);
                // Debugging: Check if medicines list is populated
                System.out.println("Number of medicines fetched: " + medicines.size());
                request.getRequestDispatcher("/views/admin/medicineManagement.jsp").forward(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new ServletException(e);
            }
        }
    }

    // Method to add new medicine
    private void addMedicine(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Medicine medicine = new Medicine();
        medicine.setMedicineName(request.getParameter("medicineName"));
        medicine.setDosageForm(request.getParameter("dosageForm"));
        medicine.setDosageStrength(request.getParameter("dosageStrength"));
        medicine.setStockQuantity(Integer.parseInt(request.getParameter("stockQuantity")));
        medicine.setPrescribedFor(request.getParameter("prescribedFor"));
        medicine.setCategory(request.getParameter("category"));

        try {
            medicineDAO.addMedicine(medicine);
            response.sendRedirect("views/admin/registrationSuccess.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            throw new IOException(e);
        }
    }

    // Method to remove medicine by ID
    private void removeMedicine(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int medicineId = Integer.parseInt(request.getParameter("medicineId"));
        try {
            medicineDAO.removeMedicine(medicineId);
            response.sendRedirect("MedicineServlet"); // Redirect back to medicine management page
        } catch (SQLException | ClassNotFoundException e) {
            throw new IOException(e);
        }
    }
}
