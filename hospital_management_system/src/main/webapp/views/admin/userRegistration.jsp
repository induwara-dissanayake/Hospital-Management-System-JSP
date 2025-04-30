<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/userRegistration.css">
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
</head>
<body>


    <div class="container">
        <h2>User Registration</h2>
        
        <form class="form-container" action="adminDashboard.jsp" method="post">
        <form id="registrationForm" onsubmit="return validateForm(event)">
        
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="fullName" required aria-describedby="fullNameError">
                <span class="error" id="fullNameError">Please enter your full name</span>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required aria-describedby="emailError">
                <span class="error" id="emailError">Please enter a valid email</span>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required aria-describedby="passwordError">
                <span class="error" id="passwordError">Password must be at least 6 characters</span>
            </div>
            <div class="form-group">
                <label for="userType">User Type</label>
                <select id="userType" name="userType" required aria-describedby="userTypeError">
                    <option value="">Select User Type</option>
                    <option value="patient">Patient</option>
                    <option value="doctor">Doctor</option>
                    <option value="reception">Reception</option>
                    <option value="pharmacy">Pharmacy Counter</option>
                    <option value="admin">Admin</option>
                </select>
              <span class="error" id="userTypeError">Please select a user type</span>
            </div>
            <div class="form-group">
                <label for="dob">Date of Birth</label>
                <input type="date" id="dob" name="dob" required aria-describedby="dobError">
                <span class="error" id="dobError">Please enter your date of birth</span>
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <select id="gender" name="gender" required aria-describedby="genderError">
                    <option value="">Select Gender</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>
                <span class="error" id="genderError">Please select your gender</span>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone" required aria-describedby="phoneError">
                <span class="error" id="phoneError">Please enter a valid phone number (10 digits)</span>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <textarea id="address" name="address" rows="4" required aria-describedby="addressError"></textarea>
                <span class="error" id="addressError">Please enter your address</span>
            </div>
            <button type="submit">Register</button>
        </form>
    </div>

    <script>
        function validateForm(event) {
            event.preventDefault();
            let isValid = true;

            // Reset error messages
            document.querySelectorAll('.error').forEach(error => error.style.display = 'none');

            // Full Name
            const fullName = document.getElementById('fullName').value.trim();
            if (!fullName) {
                document.getElementById('fullNameError').style.display = 'block';
                isValid = false;
            }
            
            // Email
            const email = document.getElementById('email').value.trim();
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                document.getElementById('emailError').style.display = 'block';
                isValid = false;
            }

            // Password
            const password = document.getElementById('password').value;
            if (password.length < 6) {
                document.getElementById('passwordError').style.display = 'block';
                isValid = false;
            }

            // User Type
            const userType = document.getElementById('userType').value;
            if (!userType) {
                document.getElementById('userTypeError').style.display = 'block';
                isValid = false;
            }

            // Date of Birth
            const dob = document.getElementById('dob').value;
            if (!dob) {
                document.getElementById('dobError').style.display = 'block';
                isValid = false;
            }

            // Gender
            const gender = document.getElementById('gender').value;
            if (!gender) {
                document.getElementById('genderError').style.display = 'block';
                isValid = false;
            }

            // Phone
            const phone = document.getElementById('phone').value.replace(/\D/g, ''); // Remove non-digits
            const phoneRegex = /^\d{10}$/;
            if (!phoneRegex.test(phone)) {
                document.getElementById('phoneError').style.display = 'block';
                isValid = false;
            }

            // Address
            const address = document.getElementById('address').value.trim();
            if (!address) {
                document.getElementById('addressError').style.display = 'block';
                isValid = false;
            }

            if (isValid) {
                // Simulate backend submission (replace with actual API call)
                console.log('Form Data:', { fullName, email, password, userType, dob, gender, phone, address });
                alert('Registration Successful!');
                document.getElementById('registrationForm').reset();

                // Example backend submission (uncomment and customize as needed):
                /*
                fetch('/api/register', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ fullName, email, password, userType, dob, gender, phone, address })
                })
                .then(response => response.json())
                .then(data => {
                    alert('Registration Successful!');
                    document.getElementById('registrationForm').reset();
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Registration Failed. Please try again.');
                });
                */
            }

            return isValid;
        }
        
        // Real-time validation on blur for better UX
        document.querySelectorAll('input, select, textarea').forEach(input => {
            input.addEventListener('blur', () => {
                const id = input.id;
                const value = input.value.trim();
                const errorElement = document.getElementById(${id}Error);

                if (id === 'email') {
                    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                    errorElement.style.display = emailRegex.test(value) || !value ? 'none' : 'block';
                } else if (id === 'password') {
                    errorElement.style.display = value.length >= 6 || !value ? 'none' : 'block';
                } else if (id === 'phone') {
                    const phone = value.replace(/\D/g, '');
                    const phoneRegex = /^\d{10}$/;
                    errorElement.style.display = phoneRegex.test(phone) || !value ? 'none' : 'block';
                } else if (id === 'fullName' || id === 'dob' || id === 'userType' || id === 'gender' || id === 'address') {
                    errorElement.style.display = value ? 'none' : 'block';
                }
            });
        });
    </script>  

</body>
</html>