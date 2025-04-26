<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Patient Records Search</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      background-color: #f9f9f9;
    }
    #patient-records-search {
      background-color: white;
      border-radius: 8px;
      padding: 24px;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
      max-width: 400px;
      margin: auto;
      display: flex;
      flex-direction: column;
      gap: 16px;
    }
    #patient-records-search h2 {
      font-weight: 600;
      color: #1a202c;
      font-size: 18px;
    }
    .form-group {
      margin-bottom: 15px;
    }
    .form-group label {
      display: block;
      font-size: 14px;
      font-weight: 500;
      color: #4a5568;
    }
    .form-group select,
    .form-group input {
      margin-top: 5px;
      width: 95%;
      padding: 10px;
      border-radius: 6px;
      border: 1px solid #d2d6dc;
      font-size: 14px;
      color: #1a202c;
      outline: none;
    }
    .form-group input::placeholder {
      color: #718096;
    }
    .form-group select:focus,
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
  <section id="patient-records-search" aria-label="Patient Records Search">
    <h2>Patient Records Search</h2>
    <form class="form-container" action="searchResults.jsp" method="post">
      <div class="form-group">
        <label for="nameorid">Search By</label>
        <input type="text" id="nameorid" name="nameorid" placeholder="Enter NIC or Patient ID" required />
      </div>
      <div class="form-group">
        <label for="searchValue">Enter Value</label>
        <input type="text" id="searchValue" name="searchValue" placeholder="Enter search value" required />
      </div>
      <button type="submit" class="submit-btn">Search</button>
    </form>
  </section>
</body>
</html>