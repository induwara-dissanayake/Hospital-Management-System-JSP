package com.hospital.controller;

import com.hospital.dao.DoctorPrescriptionDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DoctorDeletePrescriptionServlet")
public class DoctorDeletePrescriptionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        DoctorPrescriptionDao dao = new DoctorPrescriptionDao();
        try {
			dao.deletePrescription(id);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        response.sendRedirect("DoctorAddPrescriptionServlet"); 
    }
}
