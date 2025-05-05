package com.hospital.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.ReceptionOPDDao;
import com.hospital.model.OPDOrder;

import javax.servlet.ServletContext;
import java.time.LocalDate;

@WebServlet("/ReceptionOPDServlet")
public class ReceptionOPDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String patientName = request.getParameter("opdName");
	    int patientAge = Integer.parseInt(request.getParameter("opdAge"));

	    OPDOrder opd = new OPDOrder();
	    opd.setPatientName(patientName);
	    opd.setPatientAge(patientAge);

	    ServletContext context = getServletContext();
	    LocalDate today = LocalDate.now();
	    String todayStr = today.toString();

	    String lastTokenDate = (String) context.getAttribute("lastTokenDate");
	    Integer lastTokenValue = (Integer) context.getAttribute("lastTokenValue");

	    if (lastTokenDate == null || !lastTokenDate.equals(todayStr)) {
	        lastTokenValue = 1;
	    } else {
	        lastTokenValue = (lastTokenValue == null) ? 1 : lastTokenValue + 1;
	    }

	    context.setAttribute("lastTokenDate", todayStr);
	    context.setAttribute("lastTokenValue", lastTokenValue);

	    opd.setTolkenNo(lastTokenValue);

	    ReceptionOPDDao dao = new ReceptionOPDDao();
	    try {
	        dao.insertOPDPatient(opd);
	        request.setAttribute("message", "OPD patient registered successfully!");
	        request.setAttribute("token", lastTokenValue);
	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("message", "Registration failed!");
	    }

	    request.getRequestDispatcher("views/reception/opdSuccess.jsp").forward(request, response);
	}
}

