package com.hospital.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.CounterAssignMedicineDao;
import com.hospital.dao.DoctorOPDOrderDao;
import com.hospital.dao.ReceptionSearchPatientDao;
import com.hospital.dao.CounterDao;
import com.hospital.model.ClinicPrescription;
import com.hospital.model.OPDOrder;
import com.hospital.model.OPDPrescription;
import com.hospital.model.Patient;
import com.hospital.model.Prescription;

@WebServlet("/CounterAssignMedicineViewServlet")
public class CounterAssignMedicineViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CounterAssignMedicineViewServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String orderIdStr = request.getParameter("order_id");
		String patientIdStr = request.getParameter("patient_id");

		System.out.println("Received request - Order ID: " + orderIdStr + ", Patient ID: " + patientIdStr);

		// Validate parameters
		if (orderIdStr == null || orderIdStr.trim().isEmpty()) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Order ID is required");
			return;
		}

		try {
			int orderId = Integer.parseInt(orderIdStr);
			int patientId = (patientIdStr != null && !patientIdStr.trim().isEmpty()) ? Integer.parseInt(patientIdStr)
					: 0;

			System.out.println("Parsed values - Order ID: " + orderId + ", Patient ID: " + patientId);

			CounterAssignMedicineDao dao = new CounterAssignMedicineDao();

			if (patientId == 0) {
				// Handle OPD order
				System.out.println("Processing OPD order");
				DoctorOPDOrderDao opddao = new DoctorOPDOrderDao();
				OPDOrder order = opddao.getOrderById(orderId);
				if (order == null) {
					response.sendError(HttpServletResponse.SC_NOT_FOUND, "Order not found");
					return;
				}
				request.setAttribute("order", order);

				try {
					List<OPDPrescription> opdPrescriptions = dao.selectByOrderId(orderId);
					Map<Integer, Prescription> prescriptionDetails = dao.getPrescriptionDetails(opdPrescriptions);
					request.setAttribute("opdPrescriptions", opdPrescriptions);
					request.setAttribute("prescriptionDetails", prescriptionDetails);
					request.setAttribute("type", 1);
					request.getRequestDispatcher("views/counter/CounterAssignMedicineView.jsp").forward(request,
							response);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
					response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing request");
				}
			} else {
				// Handle Clinic order
				System.out.println("Processing Clinic order");
				ReceptionSearchPatientDao patientDao = new ReceptionSearchPatientDao();
				try {
					Patient patient = patientDao.getPatientById(patientId);
					if (patient == null) {
						System.out.println("Patient not found for ID: " + patientId);
						response.sendError(HttpServletResponse.SC_NOT_FOUND, "Patient not found");
						return;
					}
					System.out.println("Found patient: " + patient.getPatientName());
					request.setAttribute("patient", patient);

					List<ClinicPrescription> clinicPrescriptions = dao.selectByOrderIdclinic(orderId);
					System.out.println("Found " + (clinicPrescriptions != null ? clinicPrescriptions.size() : 0)
							+ " clinic prescriptions");

					Map<Integer, Prescription> prescriptionDetails = dao.getPrescriptionDetails(clinicPrescriptions);
					request.setAttribute("clinicPrescriptions", clinicPrescriptions);
					request.setAttribute("prescriptionDetails", prescriptionDetails);
					request.setAttribute("type", 2);
					request.getRequestDispatcher("views/counter/CounterAssignMedicineView.jsp").forward(request,
							response);
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
					response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
							"Error processing request: " + e.getMessage());
				}
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST,
					"Invalid order ID or patient ID format: " + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String orderIdStr = request.getParameter("order_id");
		String typeStr = request.getParameter("type");
		String[] selectedPrescriptions = request.getParameterValues("selected_prescriptions");

		System.out.println("Processing POST request - Order ID: " + orderIdStr + ", Type: " + typeStr);

		// Validate parameters
		if (orderIdStr == null || orderIdStr.trim().isEmpty() ||
				typeStr == null || typeStr.trim().isEmpty() ||
				selectedPrescriptions == null || selectedPrescriptions.length == 0) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required parameters");
			return;
		}

		try {
			int orderId = Integer.parseInt(orderIdStr);
			int type = Integer.parseInt(typeStr);

			CounterAssignMedicineDao dao = new CounterAssignMedicineDao();
			CounterDao counterDao = new CounterDao();

			try {
				// First complete the order with selected prescriptions
				dao.completeOrder(orderId, type, selectedPrescriptions);

				// Then update the counter_complete status
				boolean updateSuccess;
				if (type == 1) { // OPD order
					updateSuccess = counterDao.updateOPDCounterComplete(orderId);
				} else { // Clinic order
					updateSuccess = counterDao.updateClinicCounterComplete(orderId);
				}

				if (!updateSuccess) {
					System.out.println("Warning: Failed to update counter_complete status for order ID: " + orderId);
				}

				// Redirect back to the main page
				response.sendRedirect(request.getContextPath() + "/CounterAssignMedicineServlet");
			} catch (Exception e) {
				e.printStackTrace();
				response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
						"Error completing order: " + e.getMessage());
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST,
					"Invalid order ID or type format: " + e.getMessage());
		}
	}

}
