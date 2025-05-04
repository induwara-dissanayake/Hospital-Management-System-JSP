package com.hospital.controller;

import com.hospital.model.ExtendedUser;
import com.hospital.dao.ExtendedUserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/userRegister")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String role = request.getParameter("role");

        String specialization = null;
        String licenseNumber = null;
        String shift = null;

        if ("doctor".equals(role)) {
            specialization = request.getParameter("specialization");
        } else if ("pharmacist".equals(role)) {
            licenseNumber = request.getParameter("license");
        } else if ("receptionist".equals(role)) {
            shift = request.getParameter("shift");
        }

        ExtendedUser user = new ExtendedUser();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setRole(role);
        user.setSpecialization(specialization);
        user.setLicenseNumber(licenseNumber);
        user.setShift(shift);

        try {
            ExtendedUserDAO userDAO = new ExtendedUserDAO();
            boolean result = userDAO.registerUser(user);
            if (result) {
                response.sendRedirect("views/admin/registrationSuccess.jsp");
            } else {
                response.sendRedirect("registrationFail.jsp");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("registrationFail.jsp");
        }
    }
}
