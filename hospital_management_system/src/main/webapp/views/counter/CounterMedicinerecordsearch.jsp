<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medicine Records Search</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/CounterSidebar.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f1f5f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .search-container {
            background-color: white;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 1.5rem;
        }

        .header {
            margin-bottom: 1.5rem;
        }

        .header h2 {
            color: #1e293b;
            font-size: 1.5rem;
            font-weight: 600;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .search-input-container {
            position: relative;
            max-width: 600px;
        }

        .search-input {
            width: 100%;
            padding: 0.75rem 1rem 0.75rem 2.5rem;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            outline: none;
        }

        .search-input:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        .search-icon {
            position: absolute;
            left: 0.75rem;
            top: 50%;
            transform: translateY(-50%);
            color: #64748b;
        }

        .table-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .custom-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.95rem;
        }

        .custom-table th {
            background-color: #f8fafc;
            color: #475569;
            font-weight: 600;
            text-align: left;
            padding: 1rem;
            border-bottom: 2px solid #e2e8f0;
        }

        .custom-table td {
            padding: 1rem;
            border-bottom: 1px solid #e2e8f0;
            color: #1e293b;
        }

        .custom-table tr:hover {
            background-color: #f8fafc;
        }

        .badge {
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.85rem;
            font-weight: 500;
            display: inline-block;
        }

        .badge-success {
            background-color: #dcfce7;
            color: #166534;
        }

        .badge-warning {
            background-color: #fef9c3;
            color: #854d0e;
        }

        .badge-danger {
            background-color: #fee2e2;
            color: #991b1b;
        }

        .badge-info {
            background-color: #e0f2fe;
            color: #0369a1;
        }

        /* Add these styles for the update stock functionality */
        .stock-cell {
            cursor: pointer;
        }

        .stock-cell:hover .badge {
            transform: scale(1.1);
            transition: transform 0.2s;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
        }

        .modal-content {
            position: relative;
            background-color: #fff;
            margin: 15% auto;
            padding: 2rem;
            border-radius: 12px;
            width: 90%;
            max-width: 500px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .modal-header {
            margin-bottom: 1.5rem;
        }

        .modal-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: #1e293b;
            margin: 0;
        }

        .close-button {
            position: absolute;
            right: 1.5rem;
            top: 1.5rem;
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            color: #64748b;
        }

        .close-button:hover {
            color: #1e293b;
        }

        .modal-body {
            margin-bottom: 1.5rem;
        }

        .input-group {
            margin-bottom: 1rem;
        }

        .input-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #475569;
            font-weight: 500;
        }

        .input-group input {
            width: 100%;
            padding: 0.75rem;
            border: 2px solid #e2e8f0;
            border-radius: 6px;
            font-size: 1rem;
            outline: none;
        }

        .input-group input:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            border: none;
        }

        .btn-secondary {
            background-color: #e2e8f0;
            color: #475569;
        }

        .btn-primary {
            background-color: #3b82f6;
            color: white;
        }

        .btn:hover {
            transform: translateY(-1px);
        }

        .btn-secondary:hover {
            background-color: #cbd5e1;
        }

        .btn-primary:hover {
            background-color: #2563eb;
        }

        .toast {
            position: fixed;
            bottom: 1rem;
            right: 1rem;
            padding: 1rem 1.5rem;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: none;
            z-index: 1000;
            animation: slideIn 0.3s ease-out;
        }

        .toast.success {
            border-left: 4px solid #22c55e;
        }

        .toast.error {
            border-left: 4px solid #ef4444;
        }

        @keyframes slideIn {
            from {
                transform: translateX(100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        .loading {
            text-align: center;
            padding: 2rem;
            color: #64748b;
        }

        .loading .spinner {
            width: 2rem;
            height: 2rem;
            border: 3px solid #e2e8f0;
            border-top-color: #3b82f6;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 0 auto 1rem;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        .no-results {
            text-align: center;
            padding: 3rem 1rem;
            color: #64748b;
        }

        .no-results i {
            font-size: 2rem;
            margin-bottom: 1rem;
            color: #94a3b8;
        }
    </style>
</head>
<body>
    <!-- Include the sidebar component -->
    <jsp:include page="CounterSidebar.jsp" />

    <div class="content-wrapper">
        <div class="search-container">
            <div class="header">
                <h2><i class="fas fa-pills"></i> Medicine Records</h2>
            </div>
            <div class="search-input-container">
                <i class="fas fa-search search-icon"></i>
                <input type="text" 
                       id="searchInput" 
                       class="search-input" 
                       placeholder="Search by medicine name or ID..."
                       autocomplete="off">
            </div>
        </div>

        <div class="table-container">
            <div class="loading" style="display: none;">
                <div class="spinner"></div>
                <div>Loading records...</div>
            </div>
            <table class="custom-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Dosage Form</th>
                        <th>Strength</th>
                        <th>Stock</th>
                        <th>Category</th>
                        <th>Prescribed For</th>
                        <th>Last Updated</th>
                    </tr>
                </thead>
                <tbody id="medicineTableBody">
                    <!-- Results will be populated here -->
                </tbody>
            </table>
        </div>
    </div>

    <!-- Stock Update Modal -->
    <div id="updateStockModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Update Stock</h3>
                <button class="close-button">&times;</button>
            </div>
            <div class="modal-body">
                <div class="input-group">
                    <label for="currentStock">Current Stock</label>
                    <input type="text" id="currentStock" readonly>
                </div>
                <div class="input-group">
                    <label for="additionalStock">Additional Stock</label>
                    <input type="number" id="additionalStock" min="1" placeholder="Enter quantity to add">
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" onclick="closeModal()">Cancel</button>
                <button class="btn btn-primary" onclick="updateStock()">Update Stock</button>
            </div>
        </div>
    </div>

    <!-- Toast Notification -->
    <div id="toast" class="toast"></div>

    <script>
        // Get the context path from JSP
        const contextPath = '<%=request.getContextPath()%>';
        
        // DOM elements
        const searchInput = document.getElementById('searchInput');
        const tableBody = document.getElementById('medicineTableBody');
        const loadingIndicator = document.querySelector('.loading');
        
        // Debounce timer
        let searchTimeout;

        // Utility functions
        function getStockBadgeClass(quantity) {
            quantity = parseInt(quantity) || 0;
            if (quantity <= 10) return 'danger';
            if (quantity <= 30) return 'warning';
            return 'success';
        }

        function formatDate(dateString) {
            if (!dateString) return '';
            const date = new Date(dateString);
            if (isNaN(date.getTime())) return dateString;
            return date.toLocaleDateString('en-US', {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit'
            });
        }

        function escapeHtml(unsafe) {
            if (unsafe === null || unsafe === undefined) return '';
            return String(unsafe)
                .replace(/&/g, "&amp;")
                .replace(/</g, "&lt;")
                .replace(/>/g, "&gt;")
                .replace(/"/g, "&quot;")
                .replace(/'/g, "&#039;");
        }

        function createTableRow(medicine) {
            const stockQuantity = parseInt(medicine.stockQuantity) || 0;
            const stockClass = getStockBadgeClass(stockQuantity);
            const medicineId = parseInt(medicine.medicineId);
            
            const row = document.createElement('tr');
            row.innerHTML = 
                '<td>' + escapeHtml(medicineId) + '</td>' +
                '<td><strong>' + escapeHtml(medicine.medicineName) + '</strong></td>' +
                '<td>' + escapeHtml(medicine.dosageForm) + '</td>' +
                '<td>' + escapeHtml(medicine.dosageStrength) + '</td>' +
                '<td class="stock-cell" onclick="openUpdateModal(' + medicineId + ', ' + stockQuantity + ')">' +
                '<span class="badge badge-' + stockClass + '">' + stockQuantity + '</span></td>' +
                '<td><span class="badge badge-info">' + escapeHtml(medicine.category) + '</span></td>' +
                '<td>' + escapeHtml(medicine.prescribedFor) + '</td>' +
                '<td><small>' + escapeHtml(formatDate(medicine.updatedAt)) + '</small></td>';
            return row;
        }

        function displayMedicines(medicines) {
            tableBody.innerHTML = '';
            
            if (!medicines || medicines.length === 0) {
                const row = document.createElement('tr');
                row.innerHTML = 
                    '<td colspan="8" class="no-results">' +
                    '<i class="fas fa-search"></i><br>' +
                    'No medicines found' +
                    '</td>';
                tableBody.appendChild(row);
                return;
            }

            const fragment = document.createDocumentFragment();
            medicines.forEach(medicine => {
                fragment.appendChild(createTableRow(medicine));
            });
            tableBody.appendChild(fragment);
        }

        async function searchMedicines(query) {
            loadingIndicator.style.display = 'block';
            try {
                const response = await fetch(contextPath + '/CounterMedicineServlet?query=' + encodeURIComponent(query));
                if (!response.ok) throw new Error('Network response was not ok');
                const medicines = await response.json();
                displayMedicines(medicines);
            } catch (error) {
                console.error('Error fetching medicines:', error);
                tableBody.innerHTML = 
                    '<tr>' +
                    '<td colspan="8" class="no-results">' +
                    '<i class="fas fa-exclamation-triangle"></i><br>' +
                    'Error loading medicines. Please try again.' +
                    '</td>' +
                    '</tr>';
            } finally {
                loadingIndicator.style.display = 'none';
            }
        }

        // Event listeners
        searchInput.addEventListener('input', (e) => {
            clearTimeout(searchTimeout);
            searchTimeout = setTimeout(() => {
                searchMedicines(e.target.value);
            }, 300);
        });

        // Stock update functionality
        const modal = document.getElementById('updateStockModal');
        const toast = document.getElementById('toast');
        let currentMedicineId = null;

        function openUpdateModal(medicineId, currentStock) {
            console.log('Opening modal for medicine:', medicineId, 'Current stock:', currentStock);
            currentMedicineId = medicineId;
            document.getElementById('currentStock').value = currentStock;
            document.getElementById('additionalStock').value = '';
            modal.style.display = 'block';
        }

        function closeModal() {
            modal.style.display = 'none';
            currentMedicineId = null;
        }

        // Close modal when clicking outside
        modal.addEventListener('click', function(event) {
            if (event.target === modal) {
                closeModal();
            }
        });

        // Close modal when clicking the close button
        document.querySelector('.close-button').addEventListener('click', closeModal);

        function showToast(message, isSuccess = true) {
            toast.textContent = message;
            toast.className = 'toast ' + (isSuccess ? 'success' : 'error');
            toast.style.display = 'block';
            
            setTimeout(() => {
                toast.style.display = 'none';
            }, 3000);
        }

        async function updateStock() {
            const additionalStock = parseInt(document.getElementById('additionalStock').value);
            
            if (!additionalStock || additionalStock <= 0) {
                showToast('Please enter a valid quantity', false);
                return;
            }

            try {
                const formData = new URLSearchParams();
                formData.append('medicineId', currentMedicineId);
                formData.append('additionalStock', additionalStock);

                const response = await fetch(contextPath + '/CounterMedicineServlet', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: formData.toString()
                });

                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }

                const result = await response.json();
                
                if (result.success) {
                    showToast('Stock updated successfully');
                    closeModal();
                    // Refresh the table
                    searchMedicines(searchInput.value);
                } else {
                    showToast(result.message || 'Failed to update stock', false);
                }
            } catch (error) {
                console.error('Error updating stock:', error);
                showToast('Error updating stock: ' + error.message, false);
            }
        }

        // Initial load
        searchMedicines('');
    </script>
</body>
</html>