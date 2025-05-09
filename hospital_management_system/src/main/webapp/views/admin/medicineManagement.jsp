<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Medicine Management</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminManagement.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSidebar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSideLink.css">
</head>
<body>
<div class="sidebar-wrapper">
    <jsp:include page="adminSidebar.jsp" />
</div>   
<div class="main-content">
    <a href="${pageContext.request.contextPath}/views/admin/addMedicine.jsp" class="btn"><i class="fas fa-plus"></i> Add New Medicine</a>
    <div class="table-container">
        <table class="medicine-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Medicine Name</th>
                    <th>Dosage Form</th>
                    <th>Dosage Strength</th>
                    <th>Stock Quantity</th>
                    <th>Prescribed For</th>
                    <th>Category</th>
                    <th>Created At</th>
                    <th>Updated At</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty medicines}">
                    <tr><td colspan="10">No medicines found.</td></tr>
                </c:if>
                <c:forEach var="medicine" items="${medicines}">
                <tr>
                        <td>${medicine.medicineId}</td>
                        <td>${medicine.medicineName}</td>
                        <td>${medicine.dosageForm}</td>
                        <td>${medicine.dosageStrength}</td>
                        <td>${medicine.stockQuantity}</td>
                        <td>${medicine.prescribedFor}</td>
                        <td>${medicine.category}</td>
                        <td>${medicine.createdAt}</td>
                        <td>${medicine.updatedAt}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/MedicineServlet?action=removeMedicine&medicineId=${medicine.medicineId}" class="btn-delete" title="Delete">
                                <i class="fas fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>

