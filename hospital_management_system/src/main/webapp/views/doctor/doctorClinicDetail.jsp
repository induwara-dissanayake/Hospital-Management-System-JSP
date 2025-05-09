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
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorclinicdetails.css">
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
