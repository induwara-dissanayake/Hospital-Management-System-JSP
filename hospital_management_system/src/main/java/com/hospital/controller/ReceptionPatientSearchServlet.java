package com.hospital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.ReceptionSearchPatientDao;
import com.hospital.model.Patient;

/**
 * Servlet implementation class ReceptionPatientSearchServlet
 */
@WebServlet("/ReceptionPatientSearchServlet")
public class ReceptionPatientSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ReceptionSearchPatientDao receptionSearchPatientDao;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceptionPatientSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
        receptionSearchPatientDao = new ReceptionSearchPatientDao();


        String nameOrId = request.getParameter("nameorid");
        List<Patient> patients = receptionSearchPatientDao.searchPatient(nameOrId);

        request.setAttribute("patients", patients);
        request.setAttribute("searchInput", nameOrId);

        request.getRequestDispatcher("views/reception/receptionPatientSearchResult.jsp").forward(request, response);
    }

}
