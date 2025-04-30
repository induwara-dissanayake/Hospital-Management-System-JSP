<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Hospital Management System</title>
    <link rel="stylesheet" type="text/css" href="resources/css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <div class="login-wrapper">
        <div class="login-container">
            <div class="login-header">
                <i class="fas fa-hospital-user doctor-icon"></i>
                <h2>Hospital Management System</h2>
                <p>Please login to access your dashboard</p>
            </div>
            
            <% if (request.getAttribute("error") != null) { %>
                <div class="error-message">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <form action="CommonLoginServlet" method="post">
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <input type="text" name="username" placeholder="Username" required>
                </div>
                
                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="password" placeholder="Password" required>
                    <i class="fas fa-eye toggle-password"></i>
                </div>
                
                <button type="submit" class="login-btn">Login</button>
            </form>
            
            <div class="security-notice">
                <i class="fas fa-shield-alt"></i>
                <span>Secure login - Protected by encryption</span>
            </div>
        </div>
    </div>

    <script>
        document.querySelector('.toggle-password').addEventListener('click', function() {
            const passwordInput = this.previousElementSibling;
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                this.classList.remove('fa-eye');
                this.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                this.classList.remove('fa-eye-slash');
                this.classList.add('fa-eye');
            }
        });
    </script>
</body>
</html>

