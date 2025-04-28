<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Clinic Patient Registration Form</title>
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
      text-align: center;
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
    .form-group input,
    .form-group textarea {
      margin-top: 5px;
      width: 90%;
      padding: 10px;
      border-radius: 6px;
      border: 1px solid #ccc;
      font-size: 14px;
      color: #333;
      outline: none;
    }
    .form-group input::placeholder,
    .form-group textarea::placeholder {
      color: #999;
    }
    .form-group input:focus,
    .form-group textarea:focus {
      border-color: #4f5bd5;
      box-shadow: 0 0 0 3px rgba(79, 91, 213, 0.3);
    }
    .form-group textarea {
      resize: none;
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
      margin: auto;
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
      <form class="form-container" action="register.jsp" method="post">
        <h3 class="form-header">Clinic Patient</h3>
        <div class="form-group">
          <label for="clinicName">Patient Name</label>
          <input type="text" id="clinicName" name="clinicName" placeholder="Enter patient name" required />
        </div>
        <div class="form-group">
          <label for="clinicDob">Date of Birth</label>
          <input type="date" id="clinicDob" name="clinicDob" required />
        </div>
        <div class="form-group">
          <label for="clinicNIC">NIC</label>
          <input type="text" id="clinicNIC" name="clinicNIC" placeholder="Enter NIC" required />
        </div>
        <div class="form-group">
          <label for="clinicTp">Telephone Number</label>
          <input type="tel" id="clinicTp" name="clinicTp" placeholder="Enter telephone number" required />
        </div>
        <div class="form-group">
          <label for="clinicAddress">Address</label>
          <textarea id="clinicAddress" name="clinicAddress" rows="2" placeholder="Enter address" required></textarea>
        </div>
        <button type="submit" class="submit-btn">Register Clinic Patient</button>
      </form>
    </div>
  </section>
</body>
</html>