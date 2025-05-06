<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Medicine</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/addMedicine.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSidebar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSideLink.css">
    
</head>
<body>

<div class="sidebar-wrapper">
  <jsp:include page="adminSidebar.jsp" />
</div>

<div class="main-content">
<section class="tiles-container">
  <div class="tile">
    <form class="form-container" action="${pageContext.request.contextPath}/MedicineServlet" method="post">
      <h3 class="form-header">Add Medicine</h3>

      <div class="form-group">
        <label for="medicineName">Medicine Name</label>
        <input type="text" id="medicineName" name="medicineName" placeholder="Enter medicine name" required />
      </div>
      
       <div class="form-group">
        <label for="dosageName">Dosage Name</label>
        <input type="text" id="dosageName" name="dosageName" placeholder="Enter dosage name" required />
      </div>
      
       <div class="form-group">
        <label for="dosageStrength">Dosage Strength</label>
        <input type="text" id="dosageStrength" name="dosageStrength" placeholder="Enter dosage strength" required />
      </div>

       <div class="form-group">
        <label for="stockQuantity">Stock Quantity</label>
        <input type="number" id="stockQuantity" name="stockQuantity" placeholder="Enter stock quantity" required />
      </div>
      
      <div class="form-group">
        <label for="prescribedFor">Prescribed For</label>
        <input type="text" id="prescribedFor" name="prescribedFor" placeholder="Enter prescribed for" required />
      </div>
      
      <div class="form-group">
        <label for="category">Category</label>
        <input type="text" id="category" name="category" placeholder="Enter category" required />
      </div>
           
      <button type="submit" class="submit-btn">Add Medicine</button>

    </form>
</div>
</section>

</body>
</html>    

