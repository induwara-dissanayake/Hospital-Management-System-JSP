package com.hospital.controller;

import com.hospital.dao.MedicineDAO;
import com.hospital.model.Medicine;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/admin/lowStockReport")
public class AdminInventoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            MedicineDAO dao = new MedicineDAO();
            List<Medicine> lowStockMedicines = dao.getLowStockMedicines();
            request.setAttribute("medicines", lowStockMedicines);
            request.getRequestDispatcher("/views/admin/lowStockReport.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}
