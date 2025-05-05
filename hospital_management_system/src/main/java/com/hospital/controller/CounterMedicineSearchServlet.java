 package com.hospital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.CounterMedicineDao;
import com.hospital.model.CounterMedicine;

@WebServlet("/CounterMedicineSearchServlet")
public class CounterMedicineSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CounterMedicineDao counterMedicineDao;

    public CounterMedicineSearchServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CounterMedicineDao dao = new CounterMedicineDao();
        // Show all medicines by default
        List<CounterMedicine> medicines = dao.getAllMedicines();
        request.setAttribute("medicines", medicines);
        request.getRequestDispatcher("views/counter/CounterMedicineSearch.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        counterMedicineDao = new CounterMedicineDao();

        String input = request.getParameter("nameorid");
        List<CounterMedicine> medicines = counterMedicineDao.searchMedicine(input);

        request.setAttribute("medicines", medicines);
        request.setAttribute("searchInput", input);

        request.getRequestDispatcher("views/counter/CounterMedicineSearchResult.jsp").forward(request, response);
    }
}
 