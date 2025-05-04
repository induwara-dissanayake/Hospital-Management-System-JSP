package com.hospital.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hospital.dao.DoctorOPDOrderDao;
import com.hospital.model.OPDOrder;
import com.hospital.model.OPDIlness;
import com.hospital.model.OPDPrescription;

@WebServlet("/DoctorOPDViewServlet")
public class DoctorOPDViewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DoctorOPDViewServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("id"));
        DoctorOPDOrderDao dao = new DoctorOPDOrderDao();
        OPDOrder order = dao.getOrderById(orderId);

        request.setAttribute("order", order);
        request.getRequestDispatcher("views/doctor/doctorOPDDetail.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int doctorId = (int) session.getAttribute("userId");
        int orderId = Integer.parseInt(request.getParameter("order_id"));

        // Get illnesses
        String[] illnesses = request.getParameterValues("illnesses");
        List<OPDIlness> illnessList = new ArrayList<>();
        if (illnesses != null) {
            for (String illness : illnesses) {
                OPDIlness opdIllness = new OPDIlness(orderId, illness);
                illnessList.add(opdIllness);
            }
        }

        // Get prescriptions
        String[] prescriptionIds = request.getParameterValues("prescription_ids");
        String[] routines = request.getParameterValues("prescription_routines");
        String[] quantities = request.getParameterValues("prescription_quantities");
        String[] days = request.getParameterValues("prescription_days");

        List<OPDPrescription> prescriptionList = new ArrayList<>();
        if (prescriptionIds != null) {
            for (int i = 0; i < prescriptionIds.length; i++) {
                OPDPrescription prescription = new OPDPrescription();
                prescription.setOrderId(orderId);
                prescription.setDoctorId(doctorId);
                prescription.setPrescriptionId(Integer.parseInt(prescriptionIds[i]));

                // Convert routine string to integer based on selection
                int routineValue = 0;
                switch (routines[i]) {
                    case "morning":
                        routineValue = 1;
                        break;
                    case "day":
                        routineValue = 2;
                        break;
                    case "night":
                        routineValue = 3;
                        break;
                    case "morning/day":
                        routineValue = 4;
                        break;
                    case "morning/night":
                        routineValue = 5;
                        break;
                    case "day/night":
                        routineValue = 6;
                        break;
                    case "morning/day/night":
                        routineValue = 7;
                        break;
                }
                prescription.setRoutine(routineValue);

                prescription.setQty(Integer.parseInt(quantities[i]));
                prescription.setDays(Integer.parseInt(days[i]));

                prescriptionList.add(prescription);
            }
        }

        DoctorOPDOrderDao dao = new DoctorOPDOrderDao();
        boolean success = dao.saveOPDOrderDetails(orderId, illnessList, prescriptionList);

        if (success) {
            // Get next patient order
            OPDOrder nextOrder = dao.getNextOrder(orderId);
            if (nextOrder != null) {
                // Redirect to the next patient
                response.sendRedirect("DoctorOPDViewServlet?id=" + nextOrder.getId());
            } else {
                // No more patients, go back to list
                response.sendRedirect("DoctorOPDServlet");
            }
        } else {
            request.setAttribute("error", "Failed to save order details");
            doGet(request, response);
        }
    }

}
