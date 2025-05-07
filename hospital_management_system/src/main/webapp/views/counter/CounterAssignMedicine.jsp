<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hospital.model.OPDOrder" %>
<%@ page import="com.hospital.model.ClinicOrder" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assign Medicine Orders</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/CounterSidebar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f1f5f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .content-wrapper {
            margin-left: 280px;
            padding: 30px;
            min-height: 100vh;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .page-title {
            color: #1e293b;
            font-size: 24px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .orders-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
        }

        .order-section {
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .section-header {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #e2e8f0;
        }

        .section-title {
            font-size: 18px;
            font-weight: 600;
            color: #1e293b;
        }

        .order-list {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .order-card {
            background: #f8fafc;
            border-radius: 8px;
            padding: 15px;
            border: 1px solid #e2e8f0;
            transition: all 0.3s ease;
        }

        .order-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .patient-info {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .patient-name {
            font-weight: 600;
            color: #1e293b;
        }

        .patient-id {
            color: #64748b;
            font-size: 0.9em;
        }

        .order-details {
            margin-top: 10px;
            padding: 10px;
            background: #fff;
            border-radius: 6px;
            border: 1px solid #e2e8f0;
        }

        .detail-item {
            display: flex;
            justify-content: space-between;
            padding: 5px 0;
            color: #475569;
        }

        .detail-label {
            font-weight: 500;
            color: #64748b;
        }

        .assign-btn {
            background-color: #3b82f6;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 0.9em;
            transition: background-color 0.3s ease;
            margin-top: 10px;
            width: 100%;
        }

        .assign-btn:hover {
            background-color: #2563eb;
        }

        .no-orders {
            text-align: center;
            color: #64748b;
            padding: 20px;
            font-style: italic;
        }

        .status-badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.8em;
            font-weight: 500;
        }

        .status-pending {
            background-color: #fef3c7;
            color: #92400e;
        }

        .status-complete {
            background-color: #dcfce7;
            color: #166534;
        }

        @media (max-width: 1024px) {
            .orders-container {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .content-wrapper {
                margin-left: 0;
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <!-- Include the sidebar component -->
    <jsp:include page="CounterSidebar.jsp" />

    <div class="content-wrapper">
        <div class="page-header">
            <h1 class="page-title">
                <i class="fas fa-pills"></i>
                Assign Medicine Orders
            </h1>
        </div>

        <div class="orders-container">
            <!-- OPD Orders Section -->
            <div class="order-section">
                <div class="section-header">
                    <i class="fas fa-hospital-user"></i>
                    <h2 class="section-title">OPD Orders</h2>
                </div>
                <div class="order-list">
                    <% 
                    ArrayList<OPDOrder> opdOrders = (ArrayList<OPDOrder>) request.getAttribute("opdpatients");
                    if (opdOrders != null && !opdOrders.isEmpty()) {
                        for (OPDOrder order : opdOrders) {
                    %>
                        <div class="order-card" data-order-id="<%= order.getId() %>">
                            <div class="patient-info">
                                <span class="patient-name"><%= order.getPatientName() %></span>
                                <span class="status-badge <%= order.getCounterComplete() == 1 ? "status-complete" : "status-pending" %>">
                                    <%= order.getCounterComplete() == 1 ? "Completed" : "Pending" %>
                                </span>
                            </div>
                            <div class="order-details">
                                <div class="detail-item">
                                    <span class="detail-label">Token No:</span>
                                    <span><%= order.getTolkenNo() %></span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Patient Age:</span>
                                    <span><%= order.getPatientAge() %></span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Doctor Status:</span>
                                    <span><%= order.getDoctorComplete() == 1 ? "Completed" : "Pending" %></span>
                                </div>
                                <button class="assign-btn" onclick="assignMedicine('<%= order.getId() %>', 'OPD')">
                                    <i class="fas fa-check"></i> Assign Medicine
                                </button>
                            </div>
                        </div>
                    <% }
                    } else { %>
                        <div class="no-orders">No pending OPD orders</div>
                    <% } %>
                </div>
            </div>

            <!-- Clinic Orders Section -->
            <div class="order-section">
                <div class="section-header">
                    <i class="fas fa-clinic-medical"></i>
                    <h2 class="section-title">Clinic Orders</h2>
                </div>
                <div class="order-list">
                    <% 
                    ArrayList<ClinicOrder> clinicOrders = (ArrayList<ClinicOrder>) request.getAttribute("clinicpatients");
                    if (clinicOrders != null && !clinicOrders.isEmpty()) {
                        for (ClinicOrder order : clinicOrders) {
                    %>
                        <div class="order-card" data-order-id="<%= order.getId() %>" data-patient-id="<%= order.getPatientId() %>">
                            <div class="patient-info">
                                <span class="patient-name">Patient ID: <%= order.getPatientId() %></span>
                                <span class="status-badge <%= order.getCounterComplete() == 1 ? "status-complete" : "status-pending" %>">
                                    <%= order.getCounterComplete() == 1 ? "Completed" : "Pending" %>
                                </span>
                            </div>
                            <div class="order-details">
                                <div class="detail-item">
                                    <span class="detail-label">Token No:</span>
                                    <span><%= order.getTolkenNo() %></span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Clinic ID:</span>
                                    <span><%= order.getClinicId() %></span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Date:</span>
                                    <span><%= order.getDate() %></span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Doctor Status:</span>
                                    <span><%= order.getDoctorComplete() == 1 ? "Completed" : "Pending" %></span>
                                </div>
                                <button class="assign-btn" onclick="assignMedicine('<%= order.getId() %>', 'Clinic', '<%= order.getPatientId() %>')">
                                    <i class="fas fa-check"></i> Assign Medicine
                                </button>
                            </div>
                        </div>
                    <% }
                    } else { %>
                        <div class="no-orders">No pending clinic orders</div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>

    <script>
        function assignMedicine(orderId, type, patientId) {
            console.log('Assign Medicine clicked:', { orderId, type, patientId });
            const contextPath = '${pageContext.request.contextPath}';
            const url = contextPath + '/CounterAssignMedicineViewServlet?order_id=' + orderId + '&patient_id=' + (type === 'OPD' ? '0' : patientId);
            console.log('Redirecting to:', url);
            window.location.href = url;
        }
    </script>
</body>
</html>