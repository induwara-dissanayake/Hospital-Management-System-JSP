package com.hospital.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.hospital.model.Student;

public class StudentDAO { 
	
private String jdbcURL = "jdbc:mysql://localhost:3306/studentdb"; 
private String jdbcUsername = "root"; 
private String jdbcPassword = ""; 

Connection connection;

public StudentDAO() {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
         this.connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    } catch (Exception e) {
        e.printStackTrace();
    }}

public void insertStudent(Student student) { 

	 String sql = "INSERT INTO students (name, email, course) VALUES (?, ?, ?)";
	 

	 
     try { 
    	 PreparedStatement statement = connection.prepareStatement(sql);
         statement.setString(1, student.getName());
         statement.setString(2, student.getEmail());
         statement.setString(3, student.getCourse());
         statement.executeUpdate();
     } catch (Exception e) {
         e.printStackTrace();
     }

} 


public List<Student> listStudents() { 

	 List<Student> studentList = new ArrayList<>();
     String sql = "SELECT * FROM students";

     try {
    	 Statement statement = connection.createStatement();
     
          ResultSet resultSet = statement.executeQuery(sql);
         while (resultSet.next()) {
             Student student = new Student();
             student.setId(resultSet.getInt("id"));
             student.setName(resultSet.getString("name"));
             student.setEmail(resultSet.getString("email"));
             student.setCourse(resultSet.getString("course"));
             studentList.add(student);
         }
     } catch (Exception e) {
         e.printStackTrace();
     }
     
     return studentList;
	
} 



public Student getStudentById(int id) {
    Student student = null;
    try {
         
    	PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM students WHERE id = ?");
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            student = new Student(resultSet.getString("name"),resultSet.getString("email"), resultSet.getString("course"));
        }
        
    } catch (Exception e) {
        e.printStackTrace();
    }
    return student;
}

public void updateStudent(Student student) {
    try {
    	
        PreparedStatement preparedStatement = connection.prepareStatement("UPDATE students SET name = ?, email = ?, course = ? WHERE id = ?");
        preparedStatement.setString(1, student.getName());
        preparedStatement.setString(2, student.getEmail());
        preparedStatement.setString(3, student.getCourse());
        preparedStatement.setInt(4, student.getId());
        preparedStatement.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

public void deleteStudent(int id) {
    try {
        
    	PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM students WHERE id = ?");
        preparedStatement.setInt(1, id);
        preparedStatement.executeUpdate();
        
    } catch (Exception e) {
        e.printStackTrace();
    }
}



}