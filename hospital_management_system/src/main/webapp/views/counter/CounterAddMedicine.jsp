<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add Medicine</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #eaf3f4;
      text-align: center;
    }
    h1 {
      margin-top: 30px;
      color: #2e2e2e;
    }
    form {
      margin-top: 30px;
    }
    input {
      padding: 10px;
      margin: 10px;
      width: 250px;
      border-radius: 8px;
      border: 1px solid #ddd;
    }
    button {
      padding: 10px 15px;
      background-color: #4fa0a6;
      border: none;
      color: white;
      font-weight: bold;
      cursor: pointer;
      border-radius: 8px;
    }
  </style>
</head>
<body>
  <h1>Add New Medicine</h1>
  <form action="addMedicine" method="post">
    <input type="text" name="medicineid" placeholder="Medicine Id" required><br>
    <input type="text" name="medicineName" placeholder="Medicine Name" required><br>
    <input type="number" name="stockAvailable" placeholder="Stock Available" required><br>
    <input type="text" name="dosage" placeholder="Dosage (e.g., 500mg)" required><br>
    <input type="text" name="prescribedFor" placeholder="Prescribed For" required><br>
    <button type="submit">Add Medicine</button>
</form>


</body>
</html>