<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jeewaka Hospital Welcome</title>
    <link rel="stylesheet" type="text/css" href="resources/css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
<body>
   
    <div class="datetime-display" id="datetime"></div>

    <main class="welcome-screen">
        <div class="main-container">
            <section class="welcome-section">
                <div class="welcome-content">
                    <header class="welcome-header">
                        <h1 class="welcome-title">🙏🏻Welcome,</h1>
                        <h2 class="hospital-name">Jeewaka Hospital</h2>
                    </header>
                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/bfac19bf671db34168f93bce8e4b4c5c915d13c5?placeholderIfAbsent=true&apiKey=2520d274e58a407285ad35a17abcfa2f" alt="Jeewaka Hospital Welcome" class="welcome-image">
                </div>
            </section>

            <nav class="navigation-section">
                <div class="navigation-container">
                    <div class="navigation-row">
                        <div class="navigation-column">
                            <a href="views/doctor/doctorLogin.jsp" class="navigation-card" aria-label="Navigate to Doctor">
                               
                                <i class="fas fa-user-md icon doctor-icon"></i>
                                <span class="bold-text">Doctor</span>
                            </a>
                        </div>
                        <div class="navigation-column navigation-column-right">
                            <a href="views/reception/receptionLogin.jsp" class="navigation-card" aria-label="Navigate to Front Desk Assistant">
                               
                                <i class="fas fa-headset icon reception-icon"></i>
                                <span class="bold-text">Reception</span>
                            </a>
                        </div>
                    </div>

                    <div class="navigation-row navigation-row-bottom">
                        <div class="navigation-column">
                            <a href="views/counter/counterLogin.jsp" class="navigation-card medical-counter" aria-label="Navigate to Medical Counter">
                                
                                <i class="fas fa-pills icon medical-icon"></i>
                                <span class="bold-text">Medical Counter</span>
                            </a>
                        </div>
                        <div class="navigation-column navigation-column-right">
                            <a href="views/admin/adminLogin.jsp" class="navigation-card" aria-label="Navigate to Admin">
                               
                                <i class="fas fa-user-shield icon admin-icon"></i>
                                <span class="bold-text">Admin</span>
                            </a>
                        </div>
                    </div>
                </div>
            </nav>
             <div class="acknowledgment">
                <p>All rights received © 2023 Jeewaka Hospital</p>
                <p>Version 1.0.0</p>
            </div>
        </div>
    </main>

     <script>
       
        function updateDateTime() {
            const now = new Date();
            const options = { 
                weekday: 'long', 
                year: 'numeric', 
                month: 'long', 
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            };
            document.getElementById('datetime').textContent = now.toLocaleDateString('en-US', options);
        }

       
        updateDateTime();
    
        setInterval(updateDateTime, 1000);
    </script>

</body>
</html>