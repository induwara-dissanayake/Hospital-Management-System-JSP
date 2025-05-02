<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
      max-width: 500px;
      margin: auto;
      display: flex;
      flex-direction: column;
      gap: 1px;
    }
    #patient-records-search h2 {
      font-weight: 600;
      color: #1a202c;
      font-size: 18px;
      margin-bottom: 15px;
    }
    .form-row {
      display: flex;
      align-items: center;
      gap: 10px;
      margin-bottom: 15px;
    }
    .form-row input {
      flex: 1;
      padding: 10px;
      border-radius: 6px;
      border: 1px solid #d2d6dc;
      font-size: 14px;
      color: #1a202c;
      outline: none;
    }
    .form-row input::placeholder {
      color: #718096;
    }
    .form-row input:focus {
      border-color: #4f5bd5;
      box-shadow: 0 0 0 3px rgba(79, 91, 213, 0.3);
    }
    .submit-btn {
      background-color: #4f5bd5;
      color: white;
      padding: 10px 15px;
      border-radius: 6px;
      font-weight: bold;
      cursor: pointer;
      border: none;
      outline: none;
      white-space: nowrap;
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
    <form class="form-container" action="${pageContext.request.contextPath}/ReceptionPatientSearchServlet" method="post">
      <div class="form-row">
        <input type="text" id="nameorid" name="nameorid" placeholder="Enter NIC or Patient ID" required />
        <button type="submit" class="submit-btn">Search</button>
      </div>
    </form>
  </section>
</body>
</html>
