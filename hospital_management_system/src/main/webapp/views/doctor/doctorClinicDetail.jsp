<%@ page import="com.hospital.model.Patient" %>
<%@ page import="com.hospital.model.PatientReport" %>
<%@ page import="java.util.ArrayList" %>



<%
    Patient patient = (Patient) request.getAttribute("patient");
	ArrayList<PatientReport> reportList= (ArrayList<PatientReport>)request.getAttribute("patient_report");
	
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }

    Integer clinicId = (Integer) session.getAttribute("clinic_id");
    Integer orderId = (Integer) session.getAttribute("order_id");
    Integer patientId = (Integer) session.getAttribute("patient_id");// getting clinic_id from session
%>

<!DOCTYPE html>
<html>
<head>
    <title>Clinic Order Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorSidebar.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            display: flex;
        }

        .content-wrapper {
            flex: 1;
            margin-left: 280px;
            padding: 20px;
        }

        .page-header {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        h2 {
            color: #2d3748;
            margin: 0;
            font-size: 24px;
            display: flex;
            align-items: center;
        }

        h2 i {
            margin-right: 10px;
            color: #4a5568;
        }

        .order-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }

        .patient-info {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-bottom: 20px;
            background: #f7fafc;
            padding: 15px;
            border-radius: 8px;
        }

        .info-item {
            display: flex;
            flex-direction: column;
        }

        .info-label {
            font-size: 12px;
            color: #718096;
            margin-bottom: 5px;
            text-transform: uppercase;
        }

        .info-value {
            font-size: 14px;
            color: #2d3748;
            font-weight: 500;
        }

        .prescription-form {
            margin-top: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            color: #4a5568;
            font-weight: 500;
        }

        .form-input {
            width: 100%;
            padding: 10px;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .form-input:focus {
            outline: none;
            border-color: #4299e1;
            box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.1);
        }

        #search-results {
            border: 1px solid #e2e8f0;
            max-height: 200px;
            overflow-y: auto;
            position: absolute;
            background-color: #fff;
            width: 100%;
            border-radius: 0 0 6px 6px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }

        #search-results div {
            padding: 10px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        #search-results div:hover {
            background-color: #f7fafc;
        }

        .input-group {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
        }

        .add-btn {
            background: #48bb78;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .add-btn:hover {
            background: #38a169;
        }

        #selected-illnesses {
            list-style: none;
            padding: 0;
            margin: 15px 0;
        }

        #selected-illnesses li {
            background: #f7fafc;
            padding: 10px;
            margin: 5px 0;
            border-radius: 6px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .prescriptions-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        .prescriptions-table th {
            background: #f1f5f9;
            padding: 12px;
            text-align: left;
            font-weight: 600;
            color: #475569;
        }

        .prescriptions-table td {
            padding: 12px;
            border-top: 1px solid #e2e8f0;
        }

        .routine-select {
            width: 100%;
            padding: 8px;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            background: white;
        }

        .qty-input-group {
            display: flex;
            align-items: center;
            max-width: 120px;
        }

        .qty-btn {
            background: #e2e8f0;
            border: none;
            width: 24px;
            height: 24px;
            border-radius: 4px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .qty-input {
            width: 60px;
            text-align: center;
            margin: 0 5px;
            padding: 5px;
            border: 1px solid #e2e8f0;
            border-radius: 4px;
        }

        .days-input {
            width: 60px;
            padding: 8px;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            text-align: center;
        }

        .delete-btn {
            background: none;
            border: none;
            color: #e53e3e;
            cursor: pointer;
            padding: 5px;
            border-radius: 4px;
        }

        .delete-btn:hover {
            background: #fee2e2;
        }

        .submit-btn {
            background: #4299e1;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .submit-btn:hover {
            background: #3182ce;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            color: #4a5568;
            text-decoration: none;
            font-size: 14px;
            margin-top: 20px;
        }

        .back-link i {
            margin-right: 8px;
        }

        @media (max-width: 768px) {
            .content-wrapper {
                margin-left: 0;
            }
            
            .patient-info {
                grid-template-columns: 1fr;
            }
        }

        .medical-history {
            margin-top: 20px;
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .medical-history h3 {
            color: #2d3748;
            font-size: 18px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .history-table-wrapper {
            overflow-x: auto;
        }

        .history-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .history-table th {
            background: #f1f5f9;
            padding: 12px;
            text-align: left;
            font-weight: 600;
            color: #475569;
            white-space: nowrap;
        }

        .history-table td {
            padding: 12px;
            border-top: 1px solid #e2e8f0;
            color: #4a5568;
        }

        .history-table tr:hover {
            background-color: #f7fafc;
        }

        .no-history {
            color: #718096;
            text-align: center;
            padding: 20px;
            background: #f7fafc;
            border-radius: 6px;
        }

        .clinic-inputs {
            background: #f8fafc;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
        }

        .clinic-inputs h3 {
            color: #2d3748;
            font-size: 18px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .input-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .input-item {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .input-item label {
            color: #4a5568;
            font-size: 14px;
            font-weight: 500;
        }

        .input-item input {
            width: 100%;
            padding: 10px;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .input-item input:focus {
            outline: none;
            border-color: #4299e1;
            box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.1);
        }

        .input-item input::placeholder {
            color: #a0aec0;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <jsp:include page="doctorSidebar.jsp" />

    <div class="content-wrapper">
        <div class="page-header">
            <h2><i class="fas fa-notes-medical"></i>Clinic Order Details</h2>
        </div>

        <div class="order-card">
            <div class="patient-info">
                <div class="info-item">
                    <div class="info-label">Patient ID</div>
                    <div class="info-value">#<%= patient.getId() %></div>
                </div>
                <div class="info-item">
                    <div class="info-label">Patient Name</div>
                    <div class="info-value"><%= patient.getPatientName() %></div>
                </div>
                <div class="info-item">
                    <div class="info-label">NIC</div>
                    <div class="info-value"><%= patient.getPatientNic() %></div>
                </div>
            </div>

            <!-- Medical History Section -->
            <div class="medical-history">
                <h3><i class="fas fa-history"></i> Medical History</h3>
                <% if(reportList != null && !reportList.isEmpty()) { %>
                    <div class="history-table-wrapper">
                        <table class="history-table">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <% if(clinicId == 1) { // Eye clinic %>
                                        <th>Vision</th>
                                        <th>Eye Pressure</th>
                                        <th>Sugar Level</th>
                                    <% } else if(clinicId == 2) { // Cardiology clinic %>
                                        <th>Blood Pressure</th>
                                        <th>Sugar Level</th>
                                        <th>Lipid Profile</th>
                                    <% } else if(clinicId == 3) { // Gynecology clinic %>
                                        <th>Blood Pressure</th>
                                        <th>Weight</th>
                                        <th>Sugar Level</th>
                                        <th>Hemoglobin</th>
                                        <th>VDRL</th>
                                        <th>HIV</th>
                                    <% } else if(clinicId == 4) { // Neurology clinic %>
                                        <th>Blood Pressure</th>
                                        <th>Sugar Level</th>
                                    <% } else if(clinicId == 5) { // Pediatric clinic %>
                                        <th>Lipid Profile</th>
                                        <th>Hemoglobin</th>
                                    <% } %>
                                    <th>Return Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(PatientReport report : reportList) { %>
                                    <tr>
                                        <td><%= report.getDate() %></td>
                                        <% if(clinicId == 1) { // Eye clinic %>
                                            <td><%= report.getVision() != null ? report.getVision() : "-" %></td>
                                            <td><%= report.getEye_pressure() != null ? report.getEye_pressure() : "-" %></td>
                                            <td><%= report.getSugar_level() != null ? report.getSugar_level() : "-" %></td>
                                        <% } else if(clinicId == 2) { // Cardiology clinic %>
                                            <td><%= report.getBp() != null ? report.getBp() : "-" %></td>
                                            <td><%= report.getSugar_level() != null ? report.getSugar_level() : "-" %></td>
                                            <td><%= report.getLipid_profile() != null ? report.getLipid_profile() : "-" %></td>
                                        <% } else if(clinicId == 3) { // Gynecology clinic %>
                                            <td><%= report.getBp() != null ? report.getBp() : "-" %></td>
                                            <td><%= report.getWeight() != null ? report.getWeight() : "-" %></td>
                                            <td><%= report.getSugar_level() != null ? report.getSugar_level() : "-" %></td>
                                            <td><%= report.getHemoglobin() != null ? report.getHemoglobin() : "-" %></td>
                                            <td><%= report.getVdrl() != null ? report.getVdrl() : "-" %></td>
                                            <td><%= report.getHiv() != null ? report.getHiv() : "-" %></td>
                                        <% } else if(clinicId == 4) { // Neurology clinic %>
                                            <td><%= report.getBp() != null ? report.getBp() : "-" %></td>
                                            <td><%= report.getSugar_level() != null ? report.getSugar_level() : "-" %></td>
                                        <% } else if(clinicId == 5) { // Pediatric clinic %>
                                            <td><%= report.getLipid_profile() != null ? report.getLipid_profile() : "-" %></td>
                                            <td><%= report.getHemoglobin() != null ? report.getHemoglobin() : "-" %></td>
                                        <% } %>
                                        <td><%= report.getReturn_date() != null ? report.getReturn_date() : "-" %></td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                <% } else { %>
                    <p class="no-history">No medical history records found.</p>
                <% } %>
            </div>

            <form method="post" action="DoctorClinicViewServlet?next=true" class="prescription-form">
                <input type="hidden" name="patient_id" value="<%= patient.getId() %>">
                
                <!-- Clinic Specific Input Fields -->
                <div class="form-group clinic-inputs">
                    <h3><i class="fas fa-clipboard-list"></i> Clinical Measurements</h3>
                    
                    <div class="input-grid">
                        <% if(clinicId == 1) { // Eye clinic %>
                            <div class="input-item">
                                <label class="form-label">Vision</label>
                                <input type="text" name="vision" class="form-input" placeholder="Enter vision">
                            </div>
                            <div class="input-item">
                                <label class="form-label">Eye Pressure</label>
                                <input type="text" name="eye_pressure" class="form-input" placeholder="Enter eye pressure">
                            </div>
                            <div class="input-item">
                                <label class="form-label">Sugar Level</label>
                                <input type="text" name="sugar_level" class="form-input" placeholder="Enter sugar level">
                            </div>
                        <% } else if(clinicId == 2) { // Cardiology clinic %>
                            <div class="input-item">
                                <label class="form-label">Blood Pressure</label>
                                <input type="text" name="bp" class="form-input" placeholder="Enter blood pressure">
                            </div>
                            <div class="input-item">
                                <label class="form-label">Sugar Level</label>
                                <input type="text" name="sugar_level" class="form-input" placeholder="Enter sugar level">
                            </div>
                            <div class="input-item">
                                <label class="form-label">Lipid Profile</label>
                                <input type="text" name="lipid_profile" class="form-input" placeholder="Enter lipid profile">
                            </div>
                        <% } else if(clinicId == 3) { // Gynecology clinic %>
                            <div class="input-item">
                                <label class="form-label">Blood Pressure</label>
                                <input type="text" name="bp" class="form-input" placeholder="Enter blood pressure">
                            </div>
                            <div class="input-item">
                                <label class="form-label">Weight</label>
                                <input type="text" name="weight" class="form-input" placeholder="Enter weight">
                            </div>
                            <div class="input-item">
                                <label class="form-label">Sugar Level</label>
                                <input type="text" name="sugar_level" class="form-input" placeholder="Enter sugar level">
                            </div>
                            <div class="input-item">
                                <label class="form-label">Hemoglobin</label>
                                <input type="text" name="hemoglobin" class="form-input" placeholder="Enter hemoglobin">
                            </div>
                            <div class="input-item">
                                <label class="form-label">VDRL</label>
                                <input type="text" name="vdrl" class="form-input" placeholder="Enter VDRL">
                            </div>
                            <div class="input-item">
                                <label class="form-label">HIV</label>
                                <input type="text" name="hiv" class="form-input" placeholder="Enter HIV">
                            </div>
                        <% } else if(clinicId == 4) { // Neurology clinic %>
                            <div class="input-item">
                                <label class="form-label">Blood Pressure</label>
                                <input type="text" name="bp" class="form-input" placeholder="Enter blood pressure">
                            </div>
                            <div class="input-item">
                                <label class="form-label">Sugar Level</label>
                                <input type="text" name="sugar_level" class="form-input" placeholder="Enter sugar level">
                            </div>
                        <% } else if(clinicId == 5) { // Pediatric clinic %>
                            <div class="input-item">
                                <label class="form-label">Lipid Profile</label>
                                <input type="text" name="lipid_profile" class="form-input" placeholder="Enter lipid profile">
                            </div>
                            <div class="input-item">
                                <label class="form-label">Hemoglobin</label>
                                <input type="text" name="hemoglobin" class="form-input" placeholder="Enter hemoglobin">
                            </div>
                        <% } %>

                        <!-- Return Date field for all clinics -->
                        <div class="input-item">
                            <label class="form-label">Return Date</label>
                            <input type="date" name="return_date" class="form-input" required>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Add Illness</label>
                    <div class="input-group">
                        <input type="text" id="illnessInput" class="form-input" 
                               style="flex: 1;"
                               placeholder="Enter patient's illness">
                        <button type="button" class="add-btn" onclick="addIllness()">
                            <i class="fas fa-plus"></i> Add
                        </button>
                    </div>
                    <ul id="selected-illnesses"></ul>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Search Prescription</label>
                    <div class="search-wrapper">
                        <input type="text" id="prescriptionSearch" class="form-input" 
                               onkeyup="searchPrescription()" 
                               autocomplete="off"
                               placeholder="Type to search prescriptions...">
                        <div id="search-results"></div>
                    </div>
                    
                    <div class="prescriptions-table-wrapper">
                        <table class="prescriptions-table">
                            <thead>
                                <tr>
                                    <th>Prescription Name</th>
                                    <th>Routine</th>
                                    <th>Qty</th>
                                    <th>Days</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="selected-prescriptions"></tbody>
                        </table>
                    </div>
                </div>
                
                <button type="submit" class="submit-btn">
                    <i class="fas fa-save"></i> Save Clinic Record
                </button>
            </form>
        </div>

        <a href="${pageContext.request.contextPath}/DoctorClinicServlet?clinic_id=<%=clinicId %>&show_list=true" class="back-link">
            <i class="fas fa-arrow-left"></i> Back to List
        </a>
    </div>

    <script>
        function searchPrescription() {
            const query = document.getElementById('prescriptionSearch').value;
            if (query.length === 0) {
                document.getElementById('search-results').innerHTML = "";
                return;
            }

            fetch('DoctorPrescriptionSearchServlet?query=' + encodeURIComponent(query))
                .then(response => response.json())
                .then(data => {
                    const resultDiv = document.getElementById('search-results');
                    resultDiv.innerHTML = '';
                    data.forEach(prescription => {
                        const div = document.createElement('div');
                        div.textContent = prescription.prescription;
                        div.onclick = () => addPrescription(prescription.id, prescription.prescription);
                        resultDiv.appendChild(div);
                    });
                });
        }

        function addPrescription(id, name) {
            const list = document.getElementById('selected-prescriptions');

            // Check for duplicates
            const existingPrescriptions = list.querySelectorAll('input[name="prescription_ids"]');
            for (let input of existingPrescriptions) {
                if (input.value === id.toString()) {
                    return;
                }
            }

            const tr = document.createElement('tr');
            
            // Prescription name cell
            const nameCell = document.createElement('td');
            nameCell.textContent = name;

            // Routine cell
            const routineCell = document.createElement('td');
            const routineSelect = document.createElement('select');
            routineSelect.className = 'routine-select';
            routineSelect.name = 'prescription_routines';
            const routines = [
                {value: '1', text: 'morning'},
                {value: '2', text: 'day'},
                {value: '3', text: 'night'},
                {value: '4', text: 'morning/day'},
                {value: '5', text: 'morning/night'},
                {value: '6', text: 'day/night'},
                {value: '7', text: 'morning/day/night'}
            ];
            routines.forEach(routine => {
                const option = document.createElement('option');
                option.value = routine.value;
                option.textContent = routine.text;
                routineSelect.appendChild(option);
            });
            routineCell.appendChild(routineSelect);

            // Quantity cell
            const qtyCell = document.createElement('td');
            const qtyGroup = document.createElement('div');
            qtyGroup.className = 'qty-input-group';
            
            const decrementBtn = document.createElement('button');
            decrementBtn.type = 'button';
            decrementBtn.className = 'qty-btn';
            decrementBtn.innerHTML = '<i class="fas fa-minus"></i>';
            decrementBtn.onclick = () => updateQty(qtyInput, -1);
            
            const qtyInput = document.createElement('input');
            qtyInput.type = 'number';
            qtyInput.className = 'qty-input';
            qtyInput.name = 'prescription_quantities';
            qtyInput.value = '1';
            qtyInput.min = '1';
            
            const incrementBtn = document.createElement('button');
            incrementBtn.type = 'button';
            incrementBtn.className = 'qty-btn';
            incrementBtn.innerHTML = '<i class="fas fa-plus"></i>';
            incrementBtn.onclick = () => updateQty(qtyInput, 1);
            
            qtyGroup.appendChild(decrementBtn);
            qtyGroup.appendChild(qtyInput);
            qtyGroup.appendChild(incrementBtn);
            qtyCell.appendChild(qtyGroup);

            // Days cell
            const daysCell = document.createElement('td');
            const daysInput = document.createElement('input');
            daysInput.type = 'number';
            daysInput.className = 'days-input';
            daysInput.name = 'prescription_days';
            daysInput.value = '1';
            daysInput.min = '1';
            daysCell.appendChild(daysInput);

            // Delete button cell
            const deleteCell = document.createElement('td');
            const deleteBtn = document.createElement('button');
            deleteBtn.type = 'button';
            deleteBtn.className = 'delete-btn';
            deleteBtn.innerHTML = '<i class="fas fa-times"></i>';
            deleteBtn.onclick = () => tr.remove();
            deleteCell.appendChild(deleteBtn);

            // Hidden input for prescription ID
            const inputId = document.createElement('input');
            inputId.type = 'hidden';
            inputId.name = 'prescription_ids';
            inputId.value = id;
            nameCell.appendChild(inputId);

            // Append all cells
            tr.appendChild(nameCell);
            tr.appendChild(routineCell);
            tr.appendChild(qtyCell);
            tr.appendChild(daysCell);
            tr.appendChild(deleteCell);
            
            list.appendChild(tr);

            // Clear search
            document.getElementById('prescriptionSearch').value = "";
            document.getElementById('search-results').innerHTML = "";
        }

        function updateQty(input, change) {
            const newValue = parseInt(input.value) + change;
            if (newValue >= 1) {
                input.value = newValue;
            }
        }

        function addIllness() {
            const illnessInput = document.getElementById('illnessInput');
            const illnessName = illnessInput.value.trim();
            
            if (!illnessName) {
                return;
            }

            // Check for duplicates
            const list = document.getElementById('selected-illnesses');
            const existingIllnesses = list.querySelectorAll('input[name="illnesses"]');
            for (let input of existingIllnesses) {
                if (input.value.toLowerCase() === illnessName.toLowerCase()) {
                    illnessInput.value = '';
                    return;
                }
            }

            const li = document.createElement('li');
            
            const illnessText = document.createElement('span');
            illnessText.textContent = illnessName;
            
            const deleteBtn = document.createElement('i');
            deleteBtn.className = 'fas fa-times';
            deleteBtn.style.cursor = 'pointer';
            deleteBtn.style.color = '#e53e3e';
            deleteBtn.onclick = () => li.remove();

            const inputName = document.createElement('input');
            inputName.type = 'hidden';
            inputName.name = 'illnesses';
            inputName.value = illnessName;

            li.appendChild(illnessText);
            li.appendChild(deleteBtn);
            li.appendChild(inputName);
            list.appendChild(li);

            illnessInput.value = '';
        }

        // Add keyboard event listener for Enter key
        document.getElementById('illnessInput').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                addIllness();
            }
        });
    </script>
</body>
</html>
