<%@ page import="com.hospital.model.OPDOrder" %>
<%
    OPDOrder order = (OPDOrder) request.getAttribute("order");
%>

<%
    if (session == null || session.getAttribute("doctor_id") == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>OPD Order Details</title>
    <style>
        #search-results {
            border: 1px solid #ccc;
            max-height: 100px;
            overflow-y: auto;
            position: absolute;
            background-color: #fff;
            width: 200px;
        }
        #search-results div {
            padding: 5px;
            cursor: pointer;
        }
        #search-results div:hover {
            background-color: #eee;
        }
    </style>
    <script>
        function searchPrescription() {
            const query = document.getElementById('prescriptionSearch').value;
            if (query.length === 0) {
                document.getElementById('search-results').innerHTML = "";
                return;
            }

            fetch('PrescriptionSearchServlet?query=' + encodeURIComponent(query))
                .then(response => response.json())
                .then(data => {
                    const resultDiv = document.getElementById('search-results');
                    resultDiv.innerHTML = '';
                    data.forEach(prescription => {
                        const div = document.createElement('div');
                        div.textContent = prescription.prescription; // Show only the name
                        div.onclick = () => addPrescription(prescription.id, prescription.prescription); // Pass both id and name
                        resultDiv.appendChild(div);
                    });
                });
        }

        function addPrescription(id, name) {
            const list = document.getElementById('selected-prescriptions');

            // Container for display + hidden inputs
            const li = document.createElement('li');
            li.textContent = name + " ";

            // Hidden input for prescription ID
            const inputId = document.createElement('input');
            inputId.type = 'hidden';
            inputId.name = 'prescription_ids';  // Name for ID array
            inputId.value = id;

            // Hidden input for prescription name
            const inputName = document.createElement('input');
            inputName.type = 'hidden';
            inputName.name = 'prescription_names';  // Name for name array
            inputName.value = name;

            li.appendChild(inputId);
            li.appendChild(inputName);
            list.appendChild(li);

            document.getElementById('search-results').innerHTML = "";
            document.getElementById('prescriptionSearch').value = "";
        }
    </script>
</head>
<body>
    <h2>Order Details</h2>
    <p><strong>Order ID:</strong> <%= order.getId() %></p>
    <p><strong>Patient Name:</strong> <%= order.getName() %></p>
    <p><strong>Patient Age:</strong> <%= order.getAge() %></p>

    <form method="post" action="SavePrescriptionServlet">
        <input type="hidden" name="order_id" value="<%= order.getId() %>">
        
        <label>Illness:</label>
        <input type="text" name="illness" required><br><br>
        
        <label>Search Prescription:</label><br>
        <input type="text" id="prescriptionSearch" onkeyup="searchPrescription()" autocomplete="off">
        <div id="search-results"></div>

        <ul id="selected-prescriptions"></ul>
        
        <br>
        <input type="submit" value="Submit">
    </form>

    <a href="DoctorOPDServlet">Back to List</a>
</body>
</html>
