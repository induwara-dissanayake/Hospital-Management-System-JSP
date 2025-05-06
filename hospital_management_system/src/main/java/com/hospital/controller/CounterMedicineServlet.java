package com.hospital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.hospital.dao.CounterMedicineDao;
import com.hospital.model.CounterMedicine;

@WebServlet("/CounterMedicineServlet")
public class CounterMedicineServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String query = request.getParameter("query");
            CounterMedicineDao dao = new CounterMedicineDao();
            List<CounterMedicine> medicines;

            if (query == null || query.trim().isEmpty()) {
                medicines = dao.getAllMedicines();
            } else {
                // You can implement a search method in the DAO for filtering by name, use it
                // here.
                medicines = dao.searchMedicine(query); // ← Make sure this method exists in your DAO.
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            new Gson().toJson(medicines, response.getWriter());
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Error fetching medicine data\"}");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        JsonObject jsonResponse = new JsonObject();

        try {
            int medicineId = Integer.parseInt(request.getParameter("medicineId"));
            int additionalStock = Integer.parseInt(request.getParameter("additionalStock"));

            CounterMedicineDao dao = new CounterMedicineDao();
            boolean success = dao.updateMedicineStock(medicineId, additionalStock);

            if (success) {
                // Get updated medicine details
                CounterMedicine updatedMedicine = dao.getMedicineById(medicineId);
                jsonResponse.addProperty("success", true);
                jsonResponse.addProperty("message", "Stock updated successfully");
                jsonResponse.addProperty("newStock", updatedMedicine.getStockQuantity());
                jsonResponse.addProperty("updatedAt", updatedMedicine.getUpdatedAt());
            } else {
                jsonResponse.addProperty("success", false);
                jsonResponse.addProperty("message", "Failed to update stock");
            }

        } catch (NumberFormatException e) {
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Invalid input values");
        } catch (Exception e) {
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Error updating stock: " + e.getMessage());
        }

        response.getWriter().write(new Gson().toJson(jsonResponse));
    }
}
