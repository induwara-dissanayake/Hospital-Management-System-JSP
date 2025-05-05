<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer roleId = (Integer) session.getAttribute("role_id");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Medical Reports Search</title>
  <!-- Add Font Awesome CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <%
    if (roleId != null) {
        if (roleId == 1) {
  %>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorSidebar.css">
  <%
        } else if (roleId == 2) {
  %>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/receptionSidebar.css">
  <%
        }
    }
  %>
  
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f9f9f9;
      margin: 0;
      padding: 0;
      display: flex;
    }

    .sidebar-align {
      position: fixed;
      top: 0;
      left: 0;
      height: 100vh;
      z-index: 100;
    }

    #medical-reports-search {
      flex: 1;
      margin-left: 250px; /* Adjust this value based on your sidebar width */
      padding: 20px;
    }

    h2 {
      text-align: center;
      color: #333;
      margin-bottom: 20px;
    }

    .form-container {
      display: flex;
      justify-content: center;
      margin-bottom: 20px;
    }

    .form-row input[type="text"] {
      width: 300px;
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 8px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    .form-row input[type="text"]:focus {
      border-color: #4caf50;
      box-shadow: 0 2px 8px rgba(76, 175, 80, 0.3);
      outline: none;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background: #fff;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      overflow: hidden;
    }

    th, td {
      padding: 12px 15px;
      text-align: left;
      border-bottom: 1px solid #eee;
      font-size: 14px;
    }

    th {
      background: #4caf50;
      color: white;
      font-weight: bold;
    }

    tr:nth-child(even) {
      background: #f2f2f2;
    }

    .no-results {
      text-align: center;
      color: #999;
      font-style: italic;
    }

    @media (max-width: 768px) {
      table, thead, tbody, th, td, tr {
        display: block;
      }

      thead tr {
        display: none;
      }

      tr {
        margin-bottom: 15px;
        background: #fff;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        padding: 10px;
      }

      td {
        border: none;
        display: flex;
        justify-content: space-between;
        padding: 8px 10px;
      }

      td:before {
        content: attr(data-label);
        font-weight: bold;
        color: #555;
      }
    }
    tr.clickable-row {
      cursor: pointer;
    }
    tr.clickable-row:hover {
 	 	background-color: #e0f7e9;
  		transition: background-color 0.3s ease;
	}
	
	.sidebar{
	width: 259px;
	}
	  
  </style>
  <script>
    window.onload = function () {
      fetchReports("");
    };

    function fetchReports(query) {
      fetch("ReceptionMedicalServlet?query=" + encodeURIComponent(query))
        .then(response => response.json())
        .then(data => {
          const tbody = document.getElementById("reportResultsTbody");
          renderTableRows(data, tbody);
        })
        .catch(error => {
          console.error("Error:", error);
          document.getElementById("reportResultsTbody").innerHTML =
            "<tr><td colspan='5' class='no-results'>Error loading reports</td></tr>";
        });
    }

    function liveReportSearch() {
      const input = document.getElementById("searchField").value.trim();
      fetchReports(input);
    }

    function renderTableRows(data, tbody) {
      tbody.innerHTML = "";

      if (!data || data.length === 0) {
        tbody.innerHTML = "<tr><td colspan='5' class='no-results'>No reports found</td></tr>";
        return;
      }

      let tableContent = "";

      for (let i = 0; i < data.length; i++) {
        const report = data[i];

        tableContent += "<tr class='clickable-row' onclick=\"window.location.href='ReceptionMedicalDetailServlet?patient_id=" + report.patient_id + "'\">" +
          "<td data-label='Order ID'>" + (report.order_id || "") + "</td>" +
          "<td data-label='Doctor ID'>" + (report.doctor_id || "") + "</td>" +
          "<td data-label='Patient ID'>" + (report.patient_id || "") + "</td>" +
          "<td data-label='Clinic ID'>" + (report.clinic_id || "") + "</td>" +
          "<td data-label='Date'>" + (report.date || "") + "</td>" +
        "</tr>";
      }

      tbody.innerHTML = tableContent;
    }
  </script>
</head>
<body>
<%
    if (roleId != null) {
        if (roleId == 1) {
%>
            <div class="sidebar-align">
                <jsp:include page="../doctor/doctorSidebar.jsp" />
            </div>
<%
        } else if (roleId == 2) {
%>
            <div class="sidebar-align">
                <jsp:include page="../reception/receptionSidebar.jsp" />
            </div>
<%
        }
    }
%>

  <section id="medical-reports-search" aria-label="Medical Reports Search">
    <h2>Medical Reports Search</h2>
    <form class="form-container" onsubmit="return false;">
      <div class="form-row">
        <input
          type="text"
          id="searchField"
          name="searchField"
          placeholder="Enter Patient ID"
          onkeyup="liveReportSearch()"
          autocomplete="off"
        />
      </div>
    </form>
    <table id="reportResultsTable" class="table-align">
      <thead>
        <tr>
          <th>Order ID</th>
          <th>Doctor ID</th>
          <th>Patient ID</th>
          <th>Clinic ID</th>
          <th>Date</th>
        </tr>
      </thead>
      <tbody id="reportResultsTbody"></tbody>
    </table>
  </section>
</body>
</html>
