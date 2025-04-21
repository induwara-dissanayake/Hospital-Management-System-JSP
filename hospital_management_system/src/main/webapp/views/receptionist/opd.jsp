<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>OPD Patient Registration Form</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      background-color: #f9f9f9;
    }
    .tiles-container {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      justify-content: center;
      align-items: flex-start;
      padding: 20px;
    }
    .tile {
      flex: 1 1 300px;
      max-width: 400px;
      background-color: hsl(0, 0%, 100%);
      box-shadow: 0 2px 4px rgba(26, 26, 26, 0.532);
      padding: 20px;
      border-radius: 15px;
      transition: transform 0.3s ease-in-out;
    }
    .tile:hover {
      transform: scale(1.05);
    }
    .form-container {
      display: flex;
      flex-direction: column;
      gap: 20px;
    }
    .form-header {
      font-weight: bold;
      color: #333;
      font-size: 16px;
      margin-bottom: 10px;
    }
    .form-group {
      margin-bottom: 15px;
    }
    .form-group label {
      display: block;
      font-size: 14px;
      font-weight: 500;
      color: #555;
    }
    .form-group input {
      margin-top: 10px;
      width: 90%; 
      height: 15px; 
      padding: 10px;
      border-radius: 6px;
      border: 1px solid #ccc;
      font-size: 14px;
      color: #333;
      outline: none;
    }
    .form-group input::placeholder {
      color: #999;
    }
    .form-group input:focus {
      border-color: #4f5bd5;
      box-shadow: 0 0 0 3px rgba(79, 91, 213, 0.3);
    }
    .submit-btn {
      width: max-content;
      background-color: #4f5bd5;
      color: white;
      padding: 10px 15px;
      border-radius: 6px;
      font-weight: bold;
      cursor: pointer;
      border: none;
      outline: none;
    }
    .submit-btn:hover {
      background-color: #3b44b1;
    }
    .submit-btn:focus {
      box-shadow: 0 0 0 3px rgba(79, 91, 213, 0.3);
    }
  </style>
</head>
<body>
  <section class="tiles-container">
    <div class="tile">
      <form class="form-container" aria-label="OPD Patient Registration Form" action="your-server-endpoint.jsp" method="POST">
        <h2 class="form-header">OPD Patient</h2>
        <div class="form-group">
          <label for="opdName">Patient Name</label>
          <input type="text" id="opdName" name="opdName" placeholder="Enter patient name" required />
        </div>
        <div class="form-group">
          <label for="opdNIC">NIC</label>
          <input type="text" id="opdNIC" name="opdNIC" placeholder="Enter NIC" required />
        </div>
        <div class="form-group">
          <label for="opdAge">Age</label>
          <input type="number" id="opdAge" name="opdAge" placeholder="Enter age" min="0" required />
        </div>
        <button type="submit" class="submit-btn">Register OPD Patient</button>
      </form>
    </div>
  </section>
</body>
</html>