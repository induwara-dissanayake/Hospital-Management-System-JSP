package com.hospital.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.CounterMedicineDao;
import com.hospital.model.CounterMedicine;

@WebServlet("/CounterMedicineDetailServlet")
public class CounterMedicineDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CounterMedicineDao counterMedicineDao;

    public CounterMedicineDetailServlet() {
        super();
        counterMedicineDao = new CounterMedicineDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int medId = Integer.parseInt(request.getParameter("id"));

            CounterMedicine medicine = counterMedicineDao.getMedicineById(medId);

            if (medicine != null) {
                request.setAttribute("onemedicine", medicine);
                request.getRequestDispatcher("/views/counter/CounterMedicineSearchResult.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Medicine not found");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid medicine ID");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving medicine details");
        }
    }
}
