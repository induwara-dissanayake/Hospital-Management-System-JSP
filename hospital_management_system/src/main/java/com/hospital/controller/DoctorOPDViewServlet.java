package com.hospital.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.DoctorOPDOrderDao;
import com.hospital.model.OPDOrder;

@WebServlet("/DoctorOPDViewServlet")
public class DoctorOPDViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public DoctorOPDViewServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int orderId = Integer.parseInt(request.getParameter("id"));
        DoctorOPDOrderDao dao = new DoctorOPDOrderDao();
        OPDOrder order = dao.getOrderById(orderId);

        request.setAttribute("order", order);
        request.getRequestDispatcher("doctorOPDDetail.jsp").forward(request, response);
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

}
