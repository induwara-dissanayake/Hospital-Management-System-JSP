package com.hospital.controller;

import com.hospital.dao.StudentDAO;
import com.hospital.model.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentDAO studentDAO;

    public void init() {
        studentDAO = new StudentDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            studentDAO.deleteStudent(id);
            response.sendRedirect("StudentServlet");
        } 
        
        else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Student student = studentDAO.getStudentById(id);
           
                request.setAttribute("student", student);
                request.setAttribute("id", id);
                RequestDispatcher dispatcher = request.getRequestDispatcher("updateStudent.jsp");
                dispatcher.forward(request, response);
            
        } 
        
        else {
            List<Student> studentList = studentDAO.listStudents();
            request.setAttribute("studentList", studentList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("studentList.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String course = request.getParameter("course");

            Student student = studentDAO.getStudentById(id);
            
                student.setName(name);
                student.setEmail(email);
                student.setCourse(course);
                student.setId(id);
                studentDAO.updateStudent(student);

                response.sendRedirect("StudentServlet");
            
        } else {
        	
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String course = request.getParameter("course");

            Student newStudent = new Student(name, email, course);
            studentDAO.insertStudent(newStudent);

            response.sendRedirect("StudentServlet");
        }
    }
}
