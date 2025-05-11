package com.hospital.controller;

import com.hospital.dao.ExtendedUserDAO;
import com.hospital.model.ExtendedUser;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/adminUserManagement")
public class AdminUserManagementServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(AdminUserManagementServlet.class.getName());
    private ExtendedUserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new ExtendedUserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ExtendedUser> users = null;
        try {
            users = userDAO.getAllUsers();
        } catch (ClassNotFoundException | SQLException e) {
            logger.log(Level.SEVERE, "Error fetching users", e);
            throw new ServletException("Error fetching users", e);
        }
        request.setAttribute("users", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/userManagement.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String removeId = request.getParameter("removeId");

        if (removeId != null && !removeId.isEmpty()) {
            // Handle user deletion
            try {
                int userId = Integer.parseInt(removeId);
                if (userDAO.deleteUserById(userId)) {
                    response.sendRedirect(request.getContextPath() + "/adminUserManagement");
                } else {
                    request.setAttribute("error", "Failed to delete user");
                    doGet(request, response);
                }
            } catch (NumberFormatException | SQLException e) {
                logger.log(Level.SEVERE, "Error deleting user", e);
                request.setAttribute("error", "Invalid user ID or database error");
                doGet(request, response);
            } catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        } else {
            // Handle user registration
            ExtendedUser user = new ExtendedUser();
            user.setFirstName(request.getParameter("firstName"));
            user.setLastName(request.getParameter("lastName"));
            user.setEmail(request.getParameter("email"));
            user.setPhone(request.getParameter("phone"));
            user.setAddress(request.getParameter("address"));
            user.setRole(request.getParameter("role"));

            switch (user.getRole()) {
                case "doctor":
                    user.setSpecialization(request.getParameter("specialization"));
                    break;
                case "pharmacist":
                    user.setLicenseNumber(request.getParameter("license"));
                    break;
                case "receptionist":
                    user.setShift(request.getParameter("shift"));
                    break;
                default:
                    request.setAttribute("error", "Invalid role");
                    doGet(request, response);
                    return;
            }

            try {
                userDAO.registerUser(user);
                request.setAttribute("message", "User successfully registered");
                request.getRequestDispatcher("/views/admin/registrationSuccess.jsp").forward(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                logger.log(Level.SEVERE, "Error registering user", e);
                request.setAttribute("error", "Registration failed. Please try again.");
                request.getRequestDispatcher("/views/admin/userRegistration.jsp").forward(request, response);
            }
        }
    }
}
