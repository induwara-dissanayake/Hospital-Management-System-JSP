<%@ page import="com.hospital.model.OPDOrder" %>
<%
    OPDOrder order = (OPDOrder) request.getAttribute("order");
%>

<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>OPD Order Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorSidebar.css">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctoropddetail.css">
</head>
<body>
    <div class="sidebar-align">
        <jsp:include page="doctorSidebar.jsp" />
    </div>

    <div class="content-wrapper">
        <div class="page-header">
            <h2><i class="fas fa-notes-medical"></i>OPD Order Details</h2>
        </div>

        <div class="order-card">
            <div class="patient-info">
                <div class="info-item">
                    <div class="info-label">Order ID</div>
                    <div class="info-value">#<%= order.getId() %></div>
                </div>
                <div class="info-item">
                    <div class="info-label">Patient Name</div>
                    <div class="info-value"><%= order.getPatientName() %></div>
                </div>
                <div class="info-item">
                    <div class="info-label">Patient Age</div>
                    <div class="info-value"><%= order.getPatientAge() %> years</div>
                </div>
            </div>

            <form method="post" action="DoctorOPDViewServlet" class="prescription-form">
                <input type="hidden" name="order_id" value="<%= order.getId() %>">
                
                <div class="form-group">
                    <label class="form-label">Add Illness</label>
                    <div class="input-group" style="display: flex; gap: 10px; margin-bottom: 10px;">
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
                    <i class="fas fa-save"></i> Complete Order
                </button>
            </form>
        </div>

        <a href="DoctorOPDServlet" class="back-link">
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
                    return; // Prescription already added
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
            const routines = ['morning', 'day', 'night', 'morning/day', 'morning/night', 'day/night', 'morning/day/night'];
            routines.forEach(routine => {
                const option = document.createElement('option');
                option.value = routine;
                option.textContent = routine;
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

            // Hidden inputs for prescription ID and name
            const inputId = document.createElement('input');
            inputId.type = 'hidden';
            inputId.name = 'prescription_ids';
            inputId.value = id;
            nameCell.appendChild(inputId);

            const inputName = document.createElement('input');
            inputName.type = 'hidden';
            inputName.name = 'prescription_names';
            inputName.value = name;
            nameCell.appendChild(inputName);

            // Append all cells to row
            tr.appendChild(nameCell);
            tr.appendChild(routineCell);
            tr.appendChild(qtyCell);
            tr.appendChild(daysCell);
            tr.appendChild(deleteCell);
            
            // Add row to table
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

        // Remove illness search function and simplify to just add function
        function addIllness() {
            const illnessInput = document.getElementById('illnessInput');
            const illnessName = illnessInput.value.trim();
            
            if (!illnessName) {
                return;
            }

            // Check for duplicates
            const list = document.getElementById('selected-illnesses');
            const existingIllnesses = list.querySelectorAll('input[name="illness_names"]');
            for (let input of existingIllnesses) {
                if (input.value.toLowerCase() === illnessName.toLowerCase()) {
                    illnessInput.value = '';
                    return; // Illness already exists
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
                e.preventDefault(); // Prevent form submission
                addIllness();
            }
        });
    </script>
</body>
</html>
