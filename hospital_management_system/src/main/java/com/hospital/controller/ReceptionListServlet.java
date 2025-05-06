package com.hospital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hospital.dao.ReceptionListDao;
import com.hospital.model.Patient;

@WebServlet("/ReceptionListServlet")
public class ReceptionListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String query = request.getParameter("query");
            ReceptionListDao dao = new ReceptionListDao();
            List<Patient> patients;
            
            if (query == null || query.trim().isEmpty()) {
                patients = dao.getAllPatients();
            } else {
                patients = dao.searchPatient(query);
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            new Gson().toJson(patients, response.getWriter());
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Error fetching data\"}");
        }
    }
}
