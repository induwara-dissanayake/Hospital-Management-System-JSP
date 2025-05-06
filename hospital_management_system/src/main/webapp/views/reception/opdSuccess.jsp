<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.hospital.model.OPDOrder" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="refresh" content="10;URL=${pageContext.request.contextPath}/views/reception/receptionOPD.jsp" />
    <title>OPD Registration Confirmation</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/logout.css">
</head>
<body>
<%
    OPDOrder clinicOrder = (OPDOrder) request.getAttribute("clinicOrder");
%>
<div class="container">
    <h1>✔ OPD Registration Complete</h1>
    <p>The patient has been successfully registered for OPD consultation.</p>

    <div class="info-list">
        <div class="info-item">
            <div class="info-label">Full Name: <%= clinicOrder != null ? clinicOrder.getPatientName() : "Unavailable" %></div>
          
        </div>
        <div class="info-item">
            <div class="info-label">Age : <%= clinicOrder != null ? clinicOrder.getPatientAge() + " years" : "Unavailable" %></div>
        </div>
    </div>

    <div class="token-box">
        Assigned Token Number: <span><%= clinicOrder != null ? clinicOrder.getTolkenNo() : "Pending" %></span><br>   
    </div>

    <p class="redirect-msg">You will be redirected shortly to the OPD Registration page.</p>
    <a href="<c:url value='/views/reception/receptionOPD.jsp' />">Click here if not redirected automatically</a>
</div>
</body>
</html>
