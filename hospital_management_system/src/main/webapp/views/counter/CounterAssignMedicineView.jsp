<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.hospital.model.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.Period" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assign Medicine</title>
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

        .patient-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 30px;
        }

        .patient-header {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 2px solid #e2e8f0;
        }

        .patient-avatar {
            width: 60px;
            height: 60px;
            background-color: #3b82f6;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 24px;
        }

        .patient-info {
            flex: 1;
        }

        .patient-name {
            font-size: 20px;
            font-weight: 600;
            color: #1e293b;
            margin-bottom: 5px;
        }

        .patient-id {
            color: #64748b;
            font-size: 0.9em;
        }

        .patient-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .detail-item {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .detail-label {
            color: #64748b;
            font-size: 0.9em;
        }

        .detail-value {
            color: #1e293b;
            font-weight: 500;
        }

        .prescriptions-section {
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

        .prescription-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .prescription-table th,
        .prescription-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #e2e8f0;
        }

        .prescription-table th {
            background-color: #f8fafc;
            font-weight: 600;
            color: #1e293b;
        }

        .prescription-table tr:hover {
            background-color: #f8fafc;
        }

        .checkbox-cell {
            width: 50px;
            text-align: center;
        }

        .submit-btn {
            background-color: #3b82f6;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1em;
            display: flex;
            align-items: center;
            gap: 8px;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #2563eb;
        }

        @media (max-width: 768px) {
            .content-wrapper {
                margin-left: 0;
                padding: 15px;
            }

            .patient-details {
                grid-template-columns: 1fr;
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
                Assign Medicine
            </h1>
        </div>

        <form id="assignMedicineForm" action="${pageContext.request.contextPath}/CounterAssignMedicineViewServlet" method="post">
            <input type="hidden" name="order_id" value="${param.order_id}">
            <input type="hidden" name="type" value="${type}">

            <!-- Patient Details Card -->
            <div class="patient-card">
                <div class="patient-header">
                    <div class="patient-avatar">
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="patient-info">
                        <%
                        if (request.getAttribute("type").equals(1)) {
                            OPDOrder order = (OPDOrder) request.getAttribute("order");
                            if (order != null) {
                        %>
                            <h2 class="patient-name"><%= order.getPatientName() %></h2>
                            <div class="patient-details">
                                <div class="detail-item">
                                    <span class="detail-label">Token No</span>
                                    <span class="detail-value"><%= order.getTolkenNo() %></span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Patient Age</span>
                                    <span class="detail-value"><%= order.getPatientAge() %></span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Doctor Status</span>
                                    <span class="detail-value"><%= order.getDoctorComplete() == 1 ? "Completed" : "Pending" %></span>
                                </div>
                            </div>
                        <% }
                        } else {
                            Patient patient = (Patient) request.getAttribute("patient");
                            if (patient != null) {
                                // Calculate age from DOB
                                String dob = patient.getPatientDob();
                                int age = 0;
                                if (dob != null && !dob.isEmpty()) {
                                    try {
                                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                        LocalDate birthDate = LocalDate.parse(dob, formatter);
                                        age = Period.between(birthDate, LocalDate.now()).getYears();
                                    } catch (Exception e) {
                                        // Handle parsing error
                                    }
                                }
                        %>
                            <h2 class="patient-name"><%= patient.getPatientName() %></h2>
                            <div class="patient-details">
                                <div class="detail-item">
                                    <span class="detail-label">Patient ID</span>
                                    <span class="detail-value"><%= patient.getId() %></span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Age</span>
                                    <span class="detail-value"><%= age %> years</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Gender</span>
                                    <span class="detail-value"><%= patient.getGender() %></span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Blood Type</span>
                                    <span class="detail-value"><%= patient.getBloodType() %></span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Contact No</span>
                                    <span class="detail-value"><%= patient.getPatientContactNo() %></span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Guardian Name</span>
                                    <span class="detail-value"><%= patient.getPatientGuardianName() %></span>
                                </div>
                            </div>
                        <% }
                        } %>
                    </div>
                </div>
            </div>

            <!-- Prescriptions Section -->
            <div class="prescriptions-section">
                <div class="section-header">
                    <i class="fas fa-prescription"></i>
                    <h2 class="section-title">Prescribed Medicines</h2>
                </div>

                <table class="prescription-table">
                    <thead>
                        <tr>
                            <th class="checkbox-cell">
                                <input type="checkbox" id="selectAll" title="Select All">
                            </th>
                            <th>Medicine</th>
                            <th>Type</th>
                            <th>Routine</th>
                            <th>Quantity</th>
                            <th>Days</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        if (request.getAttribute("type").equals(1)) {
                            List<OPDPrescription> opdPrescriptions = (List<OPDPrescription>) request.getAttribute("opdPrescriptions");
                            Map<Integer, Prescription> prescriptionDetails = (Map<Integer, Prescription>) request.getAttribute("prescriptionDetails");
                            if (opdPrescriptions != null && prescriptionDetails != null) {
                                for (OPDPrescription opdPrescription : opdPrescriptions) {
                                    Prescription prescription = prescriptionDetails.get(opdPrescription.getPrescriptionId());
                                    if (prescription != null) {
                        %>
                                    <tr>
                                        <td class="checkbox-cell">
                                            <input type="checkbox" name="selected_prescriptions" value="<%= opdPrescription.getPrescriptionId() %>" class="prescription-checkbox">
                                        </td>
                                        <td><%= prescription.getPrescription() %></td>
                                        <td><%= prescription.getType() %></td>
                                        <td><%= opdPrescription.getRoutine() %></td>
                                        <td><%= opdPrescription.getQty() %></td>
                                        <td><%= opdPrescription.getDays() %></td>
                                    </tr>
                        <%          }
                                }
                            }
                        } else {
                            List<ClinicPrescription> clinicPrescriptions = (List<ClinicPrescription>) request.getAttribute("clinicPrescriptions");
                            Map<Integer, Prescription> prescriptionDetails = (Map<Integer, Prescription>) request.getAttribute("prescriptionDetails");
                            if (clinicPrescriptions != null && prescriptionDetails != null) {
                                for (ClinicPrescription clinicPrescription : clinicPrescriptions) {
                                    Prescription prescription = prescriptionDetails.get(clinicPrescription.getPrescriptionId());
                                    if (prescription != null) {
                        %>
                                    <tr>
                                        <td class="checkbox-cell">
                                            <input type="checkbox" name="selected_prescriptions" value="<%= clinicPrescription.getPrescriptionId() %>" class="prescription-checkbox">
                                        </td>
                                        <td><%= prescription.getPrescription() %></td>
                                        <td><%= prescription.getType() %></td>
                                        <td><%= clinicPrescription.getRoutine() %></td>
                                        <td><%= clinicPrescription.getQty() %></td>
                                        <td><%= clinicPrescription.getDays() %></td>
                                    </tr>
                        <%          }
                                }
                            }
                        } %>
                    </tbody>
                </table>

                <button type="submit" class="submit-btn">
                    <i class="fas fa-check"></i>
                    Complete Order
                </button>
            </div>
        </form>
    </div>

    <script>
        document.getElementById('assignMedicineForm').addEventListener('submit', function(e) {
            const checkboxes = document.querySelectorAll('input[name="selected_prescriptions"]:checked');
            if (checkboxes.length === 0) {
                e.preventDefault();
                alert('Please select at least one prescription to complete the order.');
            }
        });

        // Select All functionality
        document.getElementById('selectAll').addEventListener('change', function() {
            const checkboxes = document.querySelectorAll('.prescription-checkbox');
            checkboxes.forEach(checkbox => {
                checkbox.checked = this.checked;
            });
        });

        // Update Select All checkbox state when individual checkboxes change
        document.querySelectorAll('.prescription-checkbox').forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                const selectAllCheckbox = document.getElementById('selectAll');
                const allCheckboxes = document.querySelectorAll('.prescription-checkbox');
                const checkedCheckboxes = document.querySelectorAll('.prescription-checkbox:checked');
                
                selectAllCheckbox.checked = allCheckboxes.length === checkedCheckboxes.length;
                selectAllCheckbox.indeterminate = checkedCheckboxes.length > 0 && checkedCheckboxes.length < allCheckboxes.length;
            });
        });
    </script>
</body>
</html>