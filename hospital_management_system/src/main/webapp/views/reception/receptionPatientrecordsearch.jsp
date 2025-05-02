<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Patient Records Search</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      padding: 20px;
      background-color: #f9f9f9;
    }

    #patient-records-search {
      background-color: white;
      border-radius: 8px;
      padding: 24px;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
      max-width: 500px;
      margin: auto;
      position: relative;
    }

    .form-row {
      display: flex;
      gap: 10px;
    }

    input {
      flex: 1;
      padding: 10px;
      border-radius: 6px;
      border: 1px solid #ccc;
      font-size: 14px;
    }

    button {
      background-color: #4f5bd5;
      color: white;
      padding: 10px 15px;
      border-radius: 6px;
      border: none;
      cursor: pointer;
    }

    #suggestions {
      position: absolute;
      top: 100%;
      left: 0;
      right: 0;
      background: white;
      border: 1px solid #ccc;
      border-top: none;
      max-height: 200px;
      overflow-y: auto;
      z-index: 1000;
    }

    .suggestion-item {
      padding: 10px;
      cursor: pointer;
    }

    .suggestion-item:hover {
      background-color: #f0f0f0;
    }
  </style>

  <script>
    function fetchSuggestions(query) {
      if (query.length < 1) {
        document.getElementById("suggestions").innerHTML = "";
        return;
      }

      fetch("PatientLiveSearchServlet?query=" + encodeURIComponent(query))
        .then(response => response.json())
        .then(data => {
          let suggestions = document.getElementById("suggestions");
          suggestions.innerHTML = "";
          data.forEach(patient => {
            let div = document.createElement("div");
            div.className = "suggestion-item";
            div.innerText = `${patient.id} - ${patient.name} (${patient.nic})`;
            div.onclick = function () {
              document.getElementById("nameorid").value = patient.nic;
              document.getElementById("searchForm").submit();
            };
            suggestions.appendChild(div);
          });
        });
    }
  </script>
</head>
<body>
  <section id="patient-records-search">
    <h2>Patient Records Search</h2>
    <form id="searchForm" action="ReceptionPatientSearchServlet" method="post">
      <div class="form-row">
        <input type="text" id="nameorid" name="nameorid" placeholder="Enter NIC or ID" onkeyup="fetchSuggestions(this.value)" autocomplete="off" required />
        <button type="submit">Search</button>
      </div>
      <div id="suggestions"></div>
    </form>
  </section>
</body>
</html>
