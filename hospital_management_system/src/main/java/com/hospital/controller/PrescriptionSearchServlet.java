package com.hospital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hospital.dao.PrescriptionDao;
import com.hospital.model.Prescription;


@WebServlet("/PrescriptionSearchServlet")
public class PrescriptionSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public PrescriptionSearchServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String query = request.getParameter("query");

        List<Prescription> prescriptions = PrescriptionDao.searchPrescriptions(query);

        response.setContentType("application/json");
        new Gson().toJson(prescriptions, response.getWriter());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
