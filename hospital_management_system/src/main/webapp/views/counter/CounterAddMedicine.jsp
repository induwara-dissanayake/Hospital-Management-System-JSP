<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add New Medicine</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/CounterSidebar.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <style>
    body {
      margin: 0;
      padding: 0;
      min-height: 100vh;
      background: linear-gradient(120deg, #e0eafc, #cfdef3);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .form-container {
      background: rgba(255, 255, 255, 0.95);
      padding: 40px 30px;
      border-radius: 20px;
      box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.15);
      width: 400px;
      margin: 60px auto;
      backdrop-filter: blur(4px);
      border: 1px solid rgba(255, 255, 255, 0.18);
    }
    h2 {
      margin-bottom: 30px;
      color: #2e2e2e;
      letter-spacing: 1px;
      text-align: center;
      font-size: 28px;
      font-weight: 600;
      position: relative;
      padding-bottom: 10px;
    }
    h2:after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 60px;
      height: 3px;
      background: linear-gradient(90deg, #4fa0a6, #357e85);
      border-radius: 2px;
    }
    .input-group {
      position: relative;
      margin-bottom: 25px;
    }
    .input-group i {
      position: absolute;
      left: 15px;
      top: 50%;
      transform: translateY(-50%);
      color: #4fa0a6;
      font-size: 18px;
    }
    input, select {
      width: 100%;
      padding: 15px 15px 15px 45px;
      border: 2px solid #e1e1e1;
      border-radius: 12px;
      font-size: 16px;
      background: #f8fafc;
      transition: all 0.3s ease;
      box-sizing: border-box;
    }
    input:focus, select:focus {
      border-color: #4fa0a6;
      outline: none;
      box-shadow: 0 0 0 3px rgba(79, 160, 166, 0.1);
      background: #fff;
    }
    input::placeholder {
      color: #94a3b8;
    }
    button {
      width: 100%;
      padding: 15px;
      background: linear-gradient(135deg, #4fa0a6, #357e85);
      color: #fff;
      border: none;
      border-radius: 12px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      margin-top: 10px;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
    }
    button:hover {
      background: linear-gradient(135deg, #357e85, #2c666b);
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(79, 160, 166, 0.3);
    }
    button:active {
      transform: translateY(0);
    }
    .content-wrapper {
      margin-left: 280px;
      padding: 40px 0;
      min-height: 100vh;
      display: flex;
      align-items: flex-start;
      justify-content: center;
    }
    @media (max-width: 768px) {
      .content-wrapper {
        margin-left: 0;
        padding: 20px 0;
      }
      .form-container {
        margin: 20px auto;
        width: 90%;
        max-width: 400px;
      }
    }
  </style>
</head>
<body>
  <%@ include file="CounterSidebar.jsp" %>
  <div class="content-wrapper">
    <div class="form-container">
      <h2>Add New Medicine</h2>
      <form action="${pageContext.request.contextPath}/CounterAddMedicineServlet" method="post">
        <div class="input-group">
          <i class="fas fa-pills"></i>
          <input type="text" name="medicineName" placeholder="Medicine Name" required />
        </div>
        <div class="input-group">
          <i class="fas fa-capsules"></i>
          <input type="text" name="dosageForm" placeholder="Dosage Form (e.g., Tablet, Syrup)" required />
        </div>
        <div class="input-group">
          <i class="fas fa-balance-scale"></i>
          <input type="text" name="dosageStrength" placeholder="Dosage Strength (e.g., 500mg)" required />
        </div>
        <div class="input-group">
          <i class="fas fa-boxes"></i>
          <input type="number" name="stockQuantity" placeholder="Stock Quantity" min="1" required />
        </div>
        <div class="input-group">
          <i class="fas fa-notes-medical"></i>
          <input type="text" name="prescribedFor" placeholder="Prescribed For (e.g., Fever, Pain)" required />
        </div>
        <div class="input-group">
          <i class="fas fa-tags"></i>
          <input type="text" name="category" placeholder="Category (e.g., Antibiotic, Analgesic)" required />
        </div>
        <button type="submit">
          <i class="fas fa-plus-circle"></i>
          Add Medicine
        </button>
      </form>
    </div>
  </div>
</body>
</html>