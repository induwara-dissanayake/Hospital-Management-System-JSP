package com.hospital.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.model.CounterMedicine;
import com.hospital.dao.CounterDao;

@WebServlet("/CounterAddMedicineServlet")
public class CounterAddMedicineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CounterAddMedicineServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String medicineName = request.getParameter("medicineName");
		String dosageForm = request.getParameter("dosageForm");
		String dosageStrength = request.getParameter("dosageStrength");
		int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
		String prescribedFor = request.getParameter("prescribedFor");
		String category = request.getParameter("category");

		CounterMedicine medicine = new CounterMedicine();
		medicine.setMedicineName(medicineName);
		medicine.setDosageForm(dosageForm);
		medicine.setDosageStrength(dosageStrength);
		medicine.setStockQuantity(stockQuantity);
		medicine.setPrescribedFor(prescribedFor);
		medicine.setCategory(category);

		CounterDao dao = new CounterDao();
		boolean success = dao.insertMedicine(medicine);

		
			response.sendRedirect(request.getContextPath() + "/views/counter/medicalDashboard.jsp"); // Redirect to dashboard on success
		
	}
}
