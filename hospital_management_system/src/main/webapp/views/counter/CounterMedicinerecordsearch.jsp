 if (!data  data.length === 0) {
          tbody.innerHTML =
            "<tr><td colspan='5' class='no-results'>No medicines found</td></tr>";
          return;
        }

        let tableContent = "";

        for (let i = 0; i < data.length; i++) {
          const med = data[i];

          tableContent +=
            "<tr>" +
            '<td data-label="ID">' + (med.medicineId  "") + "</td>" +
            '<td data-label="Name">' + (med.medicineName  "") + "</td>" +
            '<td data-label="Stock">' + (med.stockAvailability  "") + "</td>" +
            '<td data-label="Dosage">' + (med.dosage  "") + "</td>" +
            '<td data-label="Prescribed For">' + (med.prescribedFor  "") + "</td>" +
            "</tr>";
        }

        tbody.innerHTML = tableContent;
      }
    </script>
  </head>
  <body>
    <section id="medicine-availability-search" aria-label="Medicine Availability Search">
      <h2>Medicine Availability</h2>
      <form class="form-container" onsubmit="return false;">
        <div class="form-row">
          <input
            type="text"
            id="searchTerm"
            name="searchTerm"
            placeholder="Search by medicine name"
            onkeyup="liveMedicineSearch()"
            autocomplete="off"
          />
        </div>
      </form>
      <table id="medicineResultsTable">
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Stock</th>
            <th>Dosage</th>
            <th>Prescribed For</th>
          </tr>
        </thead>
        <tbody id="medicineResultsTbody"></tbody>
      </table>
    </section>
  </body>
</html>