package com.hospital.controller;

import com.hospital.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM user_registrations WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.executeUpdate();

            response.sendRedirect(request.getContextPath() + "/views/admin/userManagement.jsp?message=User deleted successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error deleting user");
        }
    }
}
