<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Patient Records Search</title>
    <style>
  body {
    font-family: Arial, sans-serif;
    background: #f9f9f9;
    margin: 0;
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

  th,
  td {
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
    table,
    thead,
    tbody,
    th,
    td,
    tr {
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

  .view-btn {
    display: inline-block;
    padding: 6px 12px;
    background: #4caf50;
    color: white;
    text-decoration: none;
    border-radius: 4px;
    font-size: 14px;
  }

  .view-btn:hover {
    background: #45a049;
  }

  tr.clickable-row {
    cursor: pointer;
  }

  tr.clickable-row:hover {
    background-color: #e0f7e9;
    transition: background-color 0.3s ease;
  }
</style>

    <script>
      window.onload = function () {
        loadAllPatients();
      };

      function loadAllPatients() {
        fetch("ReceptionPatientServlet?query=")
          .then((response) => response.json())
          .then((data) => {
            console.log("Loading all patients:", data);
            const tbody = document.getElementById("patientResultsTbody");
            renderTableRows(data, tbody);
          })
          .catch((error) => {
            console.error("Error:", error);
            const tbody = document.getElementById("patientResultsTbody");
            tbody.innerHTML =
              "<tr><td colspan='9' class='no-results'>Error loading patients</td></tr>";
          });
      }

      function livePatientSearch() {
        const input = document.getElementById("nameorid").value.trim();
        const tbody = document.getElementById("patientResultsTbody");

        fetch("ReceptionPatientServlet?query=" + encodeURIComponent(input))
          .then((response) => response.json())
          .then((data) => {
            console.log("Search results:", data);
            renderTableRows(data, tbody);
          })
          .catch((error) => {
            console.error("Error:", error);
            tbody.innerHTML =
              "<tr><td colspan='9' class='no-results'>Error fetching data</td></tr>";
          });
      }

      function renderTableRows(data, tbody) {
        tbody.innerHTML = "";

        if (!data || data.length === 0) {
          tbody.innerHTML =
            "<tr><td colspan='5' class='no-results'>No patients found</td></tr>";
          return;
        }

        let tableContent = "";

        for (let i = 0; i < data.length; i++) {
          const patient = data[i];
          console.log("Processing patient:", i, patient);

          tableContent +=
        	  "<tr class='clickable-row' onclick=\"window.location.href='ReceptionPatientDetailServlet?id=" + patient.id + "'\">" +
            '<td data-label="ID">' +
            (patient.id || "") +
            "</td>" +
            '<td data-label="Name">' +
            (patient.patientName || "") +
            "</td>" +
            '<td data-label="DOB">' +
            (patient.patientDob || "") +
            "</td>" +
            '<td data-label="Clinic ID">' +
            (patient.clinicId || "") +
            "</td>" +
            '<td data-label="NIC">' +
            (patient.patientNic || "") +
            "</td>" +
            "</tr>";
        }

        tbody.innerHTML = tableContent;
      }
    </script>
  </head>
  <body>
    <section id="patient-records-search" aria-label="Patient Records Search">
      <h2>Patient Records Search</h2>
      <form class="form-container" onsubmit="return false;">
        <div class="form-row">
          <input
            type="text"
            id="nameorid"
            name="nameorid"
            placeholder="Enter NIC or Patient ID"
            onkeyup="livePatientSearch()"
            autocomplete="off"
          />
        </div>
      </form>
      <table id="patientResultsTable">
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>DOB</th>
            <th>Clinic ID</th>
            <th>NIC</th>
          </tr>
        </thead>
        <tbody id="patientResultsTbody"></tbody>
      </table>
    </section>
  </body>
</html>
