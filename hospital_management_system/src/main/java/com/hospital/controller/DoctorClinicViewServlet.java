package com.hospital.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hospital.dao.DoctorClinicReportDao;
import com.hospital.dao.ReceptionSearchPatientDao;
import com.hospital.model.Ilness;
import com.hospital.model.Patient;
import com.hospital.model.PatientReport;

@WebServlet("/DoctorClinicViewServlet")
public class DoctorClinicViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DoctorClinicViewServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int patientId = Integer.parseInt(request.getParameter("patient_id"));
		int orderId = Integer.parseInt(request.getParameter("order_id"));

		HttpSession session = request.getSession();
		session.setAttribute("order_id", orderId);
		session.setAttribute("patient_id", patientId);

		DoctorClinicReportDao dao = new DoctorClinicReportDao();
		ArrayList<PatientReport> reportList = dao.getAllReports(patientId);

		List<Ilness> ilnessList = null;
		try {
			ilnessList = dao.getIllnessesByPatientId(patientId);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ReceptionSearchPatientDao patientDao = new ReceptionSearchPatientDao();

		Patient patient = null;
		try {
			patient = patientDao.getPatientById(patientId);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("patient", patient);
		request.setAttribute("patient_report", reportList);
		request.setAttribute("ilnessList", ilnessList);

		request.getRequestDispatcher("views/doctor/doctorClinicDetail.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Integer doctorId = (Integer) session.getAttribute("userId");
		Integer clinicId = (Integer) session.getAttribute("clinic_id");
		Integer orderId = (Integer) session.getAttribute("order_id");
		Integer patientId = (Integer) session.getAttribute("patient_id");

		if (doctorId == null || clinicId == null || orderId == null || patientId == null) {
			response.sendRedirect("doctorLogin.jsp");
			return;
		}

		DoctorClinicReportDao dao = null;
		try {
			dao = new DoctorClinicReportDao();
			boolean success = true;

			// Get clinical measurements based on clinic type
			String weight = request.getParameter("weight");
			String sugarLevel = request.getParameter("sugar_level");
			String bp = request.getParameter("bp");
			String lipidProfile = request.getParameter("lipid_profile");
			String hemoglobin = request.getParameter("hemoglobin");
			String vision = request.getParameter("vision");
			String eyePressure = request.getParameter("eye_pressure");
			String vdrl = request.getParameter("vdrl");
			String hiv = request.getParameter("hiv");

			// Get return date
			String returnDateStr = request.getParameter("return_date");
			Date returnDate = null;
			if (returnDateStr != null && !returnDateStr.isEmpty()) {
				returnDate = Date.valueOf(returnDateStr);
			}

			// Save clinical report
			success &= dao.saveClinicReport(orderId.intValue(), doctorId.intValue(),
					patientId.intValue(), clinicId.intValue(),
					weight, sugarLevel, bp, lipidProfile, hemoglobin, vision,
					eyePressure, vdrl, hiv, returnDate);

			// Save illnesses
			String[] illnesses = request.getParameterValues("illnesses");
			if (illnesses != null && illnesses.length > 0) {
				success &= dao.saveIllnesses(orderId.intValue(), patientId.intValue(),
						clinicId.intValue(), Arrays.asList(illnesses));
			}

			// Save prescriptions
			String[] prescriptionIds = request.getParameterValues("prescription_ids");
			String[] routines = request.getParameterValues("prescription_routines");
			String[] quantities = request.getParameterValues("prescription_quantities");
			String[] days = request.getParameterValues("prescription_days");

			if (prescriptionIds != null && prescriptionIds.length > 0) {
				List<Integer> prescIds = Arrays.stream(prescriptionIds)
						.map(Integer::parseInt)
						.collect(Collectors.toList());
				List<Integer> qtys = Arrays.stream(quantities)
						.map(Integer::parseInt)
						.collect(Collectors.toList());
				List<Integer> daysInt = Arrays.stream(days)
						.map(Integer::parseInt)
						.collect(Collectors.toList());

				success &= dao.savePrescriptions(orderId.intValue(), doctorId.intValue(),
						patientId.intValue(), clinicId.intValue(),
						prescIds, Arrays.asList(routines), qtys, daysInt);
			}

			// Update clinic record status
			if (success) {
				success &= dao.updateClinicRecordStatus(orderId.intValue());
			}

			if (success) {
				// Check if we should show the next patient
				String showNext = request.getParameter("next");
				if ("true".equals(showNext)) {
					// Get next patient for this clinic
					Integer nextPatientId = dao.getNextPatientId(clinicId.intValue(), orderId.intValue());
					if (nextPatientId != null) {
						// Get the order ID for the next patient
						Integer nextOrderId = dao.getOrderIdForPatient(nextPatientId, clinicId.intValue());
						if (nextOrderId != null) {
							response.sendRedirect(
									"DoctorClinicViewServlet?patient_id=" + nextPatientId + "&order_id=" + nextOrderId);
							return;
						}
					}
				}
				// If no next patient or not requested, go back to list
				response.sendRedirect("DoctorClinicServlet?clinic_id=" + clinicId);
			} else {
				// Fetch required data before forwarding
				ReceptionSearchPatientDao patientDao = new ReceptionSearchPatientDao();
				Patient patient = patientDao.getPatientById(patientId.intValue());
				ArrayList<PatientReport> reportList = dao.getAllReports(patientId.intValue());
				List<Ilness> ilnessList = dao.getIllnessesByPatientId(patientId.intValue());

				request.setAttribute("patient", patient);
				request.setAttribute("patient_report", reportList);
				request.setAttribute("ilnessList", ilnessList);
				request.setAttribute("error", "Failed to save clinic record");
				request.getRequestDispatcher("views/doctor/doctorClinicDetail.jsp").forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			// Fetch required data before forwarding
			try {
				ReceptionSearchPatientDao patientDao = new ReceptionSearchPatientDao();
				DoctorClinicReportDao clinicDao = new DoctorClinicReportDao();
				Patient patient = patientDao.getPatientById(patientId.intValue());
				ArrayList<PatientReport> reportList = clinicDao.getAllReports(patientId.intValue());
				List<Ilness> ilnessList = clinicDao.getIllnessesByPatientId(patientId.intValue());

				request.setAttribute("patient", patient);
				request.setAttribute("patient_report", reportList);
				request.setAttribute("ilnessList", ilnessList);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			request.setAttribute("error", "An error occurred: " + e.getMessage());
			request.getRequestDispatcher("views/doctor/doctorClinicDetail.jsp").forward(request, response);
		}
	}

}
