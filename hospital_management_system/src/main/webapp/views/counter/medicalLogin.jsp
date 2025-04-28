<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Medical Counter Login | Hospital Management System</title>

  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet"/>

  <style>
    body {
      font-family: 'Inter', sans-serif;
    }
  </style>
</head>

<body class="bg-[#edf7ff] min-h-screen flex flex-col justify-center items-center px-4">
  <main class="bg-white rounded-2xl shadow-lg max-w-sm w-full p-10 flex flex-col items-center">
    <div class="text-[#4f8b95] mb-4">
      <img
        alt="Icon representing a pharmacist in #4f8b95 color"
        class="w-12 h-12"
        height="48"
        width="48"
        src="https://cdn-icons-png.flaticon.com/512/2055/2055326.png"
        style="filter: invert(34%) sepia(33%) saturate(1443%) hue-rotate(146deg) brightness(87%) contrast(87%);"
      />
    </div>
    <h1 class="text-[#4f8b95] font-semibold text-xl mb-1">Medical Counter Login</h1>
    
    <p class="text-gray-600 mb-8 text-center text-sm">
      Hospital Management System
    </p>

    <form class="w-full space-y-4" action="MedicalCounterLoginServlet" method="post">
      <div>
        <label class="relative block">
          <span class="absolute inset-y-0 left-3 flex items-center text-gray-400">
            <i class="fas fa-user"></i>
          </span>
          <input
            id="username"
            name="username"
            type="text"
            placeholder="Username"
            required
            class="pl-10 pr-3 py-2 w-full border border-gray-300 rounded-md text-gray-700 placeholder-gray-500 focus:outline-none focus:ring-1 focus:ring-[#4f8b95] focus:border-[#4f8b95]"
          />
        </label>
      </div>
      <div>
        <label class="relative block">
          <span class="absolute inset-y-0 left-3 flex items-center text-gray-400">
            <i class="fas fa-lock"></i>
          </span>
          <input
            id="password"
            name="password"
            type="password"
            placeholder="Password"
            required
            class="pl-10 pr-10 py-2 w-full border border-[#4f8b95] rounded-md text-gray-700 placeholder-gray-500 focus:outline-none focus:ring-1 focus:ring-[#4f8b95] focus:border-[#4f8b95]"
          />
          <span id="togglePassword" aria-label="Toggle password visibility" class="absolute inset-y-0 right-3 flex items-center text-gray-400 cursor-pointer select-none">
            <i class="fas fa-eye"></i>
          </span>
        </label>
      </div>
      <div class="flex items-center text-sm text-gray-700 justify-between">
        <label class="inline-flex items-center cursor-pointer">
          <input type="checkbox" class="form-checkbox h-4 w-4 text-[#4f8b95]" />
          <span class="ml-2 select-none">Remember me</span>
        </label>
        <a href="#" class="text-[#4f8b95] hover:underline">Forgot password?</a>
      </div>
      <button type="submit" class="mt-4 w-full bg-[#4f8b95] text-white font-semibold py-3 rounded-md flex justify-center items-center gap-2 hover:bg-[#3b6f75] transition-colors">
        <i class="fas fa-sign-in-alt"></i> Login
      </button>
    </form>
  </main>

  <footer class="mt-8 flex items-center gap-2 text-gray-600 text-xs">
    <i class="fas fa-shield-alt text-[#3b6f75]"></i>
    <span>Secure login protected by encryption</span>
  </footer>

  <script>
    const togglePassword = document.getElementById('togglePassword');
    const passwordInput = document.getElementById('password');

    togglePassword.addEventListener('click', () => {
      const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
      passwordInput.setAttribute('type', type);
      togglePassword.innerHTML =
        type === 'password'
          ? '<i class="fas fa-eye"></i>'
          : '<i class="fas fa-eye-slash"></i>';
    });
  </script>

</body>
</html>
