<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String loggedInUser = (String) session.getAttribute("username");
    if (loggedInUser == null || loggedInUser.isEmpty()) {
        loggedInUser = "Admin";
    }
%>

<!-- Sidebar Overlay for mobile -->
<div class="sidebar-overlay" id="sidebarOverlay" style="display:none;"></div>

<div class="sidebar">
    <div class="sidebar-header">
        <img src="https://cdn-icons-png.flaticon.com/512/1077/1077114.png" alt="Admin Profile" class="profile-pic">
        <div class="username"><%= loggedInUser %></div>
        <div class="role">Admin</div>
    </div>

    <div class="nav">
        <a href="${pageContext.request.contextPath}/views/admin/adminDashboard.jsp" class="nav-item active">
            <div class="nav-header">
                <i class="fas fa-home nav-icon"></i>
                <span class="nav-text">Admin Panel</span>
            </div>
        </a>
        
        <!-- User Management Section -->
        <div class="nav-item" id="userItem">
            <div class="nav-header">
                <i class="fas fa-users nav-icon"></i>
                <span class="nav-text">User Management</span>
                <i class="fas fa-chevron-down" style="margin-left: auto; font-size: 0.8rem;"></i>
            </div>
            <div class="submenu">
                <a href="${pageContext.request.contextPath}/views/admin/userRegistration.jsp" class="submenu-item">User Registration</a>
                <a href="${pageContext.request.contextPath}/userManagementServlet" class="submenu-item">User List</a>
            </div>
        </div>

        <!-- Medicine Management Section -->
        <div class="nav-item" id="medicineItem">
            <div class="nav-header">
                <i class="fas fa-pills nav-icon"></i>
                <span class="nav-text">Medicine Management</span>
                <i class="fas fa-chevron-down" style="margin-left: auto; font-size: 0.8rem;"></i>
            </div>
            <div class="submenu">
                <a href="${pageContext.request.contextPath}/views/admin/addMedicine.jsp" class="submenu-item">Add Medicines</a>
                <a href="${pageContext.request.contextPath}/MedicineServlet" class="submenu-item">Medicine List</a>
            </div>
        </div>

        <!-- Reports Management Section -->
        <div class="nav-item" id="reportsItem">
            <div class="nav-header">
                <i class="fas fa-file-alt nav-icon"></i>
                <span class="nav-text">Reports Management</span>
                <i class="fas fa-chevron-down" style="margin-left: auto; font-size: 0.8rem;"></i>
            </div>
            <div class="submenu">
                <a href="${pageContext.request.contextPath}/views/admin/patientReport.jsp" class="submenu-item">Patient Report</a>
                <a href="${pageContext.request.contextPath}/views/admin/appointmentReport.jsp" class="submenu-item">Appointment Report</a>
                <a href="${pageContext.request.contextPath}/views/admin/medicineReport.jsp" class="submenu-item">Medicine Report</a>
                <a href="${pageContext.request.contextPath}/views/admin/doctorReport.jsp" class="submenu-item">Doctor Report</a>
                <a href="${pageContext.request.contextPath}/views/admin/Inventory.jsp" class="submenu-item">Inventory Report</a>
            </div>
        </div>

    </div>

    <div class="logout">
        <a href="${pageContext.request.contextPath}/CommonLogoutServlet" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-sign-out-alt nav-icon"></i>
                <span class="nav-text">Logout</span>
            </div>
        </a>
    </div>
</div>

<script>
(function() {
  const sidebar = document.querySelector('.sidebar');
  const toggleBtn = document.getElementById('sidebarToggleBtn');
  const overlay = document.getElementById('sidebarOverlay');

  function openSidebar() {
    sidebar.classList.add('open');
    overlay.style.display = 'block';
    document.body.style.overflow = 'hidden';
  }
  function closeSidebar() {
    sidebar.classList.remove('open');
    overlay.style.display = 'none';
    document.body.style.overflow = '';
  }
  function toggleSidebar() {
    if (window.innerWidth <= 900) {
      if (sidebar.classList.contains('open')) {
        closeSidebar();
      } else {
        openSidebar();
      }
    } else {
      sidebar.classList.toggle('collapsed');
    }
  }
  toggleBtn.addEventListener('click', function(e) {
    e.stopPropagation();
    toggleSidebar();
  });
  overlay.addEventListener('click', closeSidebar);
  // Responsive: auto-close on resize
  window.addEventListener('resize', function() {
    if (window.innerWidth > 900) {
      closeSidebar();
    }
  });
  // Submenu animation
  document.querySelectorAll('.nav-header').forEach(header => {
    header.addEventListener('click', function(e) {
      const navItem = this.closest('.nav-item');
      if (navItem && navItem.querySelector('.submenu')) {
        navItem.classList.toggle('active');
        // Only one submenu open at a time
        document.querySelectorAll('.nav-item').forEach(item => {
          if (item !== navItem) item.classList.remove('active');
        });
      }
    });
  });
})();
</script>
