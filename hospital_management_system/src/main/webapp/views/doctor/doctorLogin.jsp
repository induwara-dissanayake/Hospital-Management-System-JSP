<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Login | Hospital Management System</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">

</head>
<body>
<div class="login-wrapper">
    <div class="login-container">
        <div class="login-header">
            <i class="fas fa-user-md doctor-icon"></i>
            <h2>Doctor Login</h2>
            <p>Hospital Management System</p>
        </div>
        
        <%-- Display error message if authentication failed --%>
        <% if(request.getParameter("error") != null) { %>
            <div class="error-message">
                Invalid username or password. Please try again.
            </div>
        <% } %>
        
        <form action="${pageContext.request.contextPath}/DoctorLoginServlet" method="post">
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" name="username" placeholder="Username" required autofocus>
            </div>
            
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" id="password" placeholder="Password" required>
                <i class="fas fa-eye toggle-password" onclick="togglePassword()"></i>
            </div>
            
            <div class="options">
                <label>
                    <input type="checkbox" name="remember"> Remember me
                </label>
                <a href="forgot-password.jsp">Forgot password?</a>
            </div>
            
            <button type="submit" class="login-btn">
                <i class="fas fa-sign-in-alt"></i> Login
            </button>
        </form>
    </div>
    
    <div class="security-notice">
        <i class="fas fa-shield-alt"></i>
        <span>Secure login protected by encryption</span>
    </div>
</div>

<script>
function togglePassword() {
    const password = document.getElementById('password');
    const icon = document.querySelector('.toggle-password');
    if(password.type === 'password') {
        password.type = 'text';
        icon.classList.replace('fa-eye', 'fa-eye-slash');
    } else {
        password.type = 'password';
        icon.classList.replace('fa-eye-slash', 'fa-eye');
    }
}
</script>
</body>
</html>