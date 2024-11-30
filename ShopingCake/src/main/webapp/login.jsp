<%@ page pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="utf-8"/>
  <meta content="Login and Registration Page" name="description"/>
  <meta content="Login, Register, Tailwind CSS" name="keywords"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
  <meta content="ie=edge" http-equiv="X-UA-Compatible"/>
  <title>
   Login/Register
  </title>
  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&amp;display=swap" rel="stylesheet"/>
  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com">
  </script>
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
 </head>
 <body class="bg-gray-100 font-sans leading-normal tracking-normal">
  <!-- Header -->
  <header class="bg-green-600 p-4 text-white text-center">
   <h1 class="text-3xl font-bold">
    Welcome to Our Website
   </h1>
  </header>
  <!-- Breadcrumb Section -->
  <section class="bg-gray-200 py-4">
   <div class="container mx-auto text-center">
    <h2 class="text-2xl font-semibold">
     Login/Register
    </h2>
    <div class="text-gray-600">
     <a class="hover:underline" href="Home">
      Home
     </a>
     <span>
      / Login/Register
     </span>
    </div>
   </div>
  </section>
  <!-- Contact Form Section -->
  <div class="container mx-auto py-8">
   <div class="flex flex-wrap -mx-4">
    <!-- Login Form -->
    <div class="w-full md:w-1/2 px-4 mb-8 md:mb-0">
     <div class="bg-white p-6 rounded-lg shadow-lg border border-green-600">
      <h3 class="text-center text-2xl font-semibold mb-4">
       Login
      </h3>
      <form action="UsersLoginServlet" method="post">
       <div class="mb-4">
        <label class="block text-gray-700" for="email">
         Username
        </label>
        <input class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-600" id="email" name="user-name" placeholder="Username or email" required="" type="text"/>
       </div>
       <div class="mb-4">
        <label class="block text-gray-700" for="pwd">
         Password
        </label>
        <input class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-600" id="pwd" name="user-password" placeholder="Password" required="" type="password"/>
       </div>
       <!-- Hiển thị thông báo lỗi nếu có -->
       <%
          String error = (String) session.getAttribute("errorlogin");
          if (error != null) {
       %>
       <div class="text-red-600 mb-4 text-center">
         <%= error %>
       </div>
       <% 
          session.removeAttribute("errorlogin"); // Xóa thông báo sau khi hiển thị
          }
       %>
       <div class="mt-3 text-center">
							<h6><a href="forgot_password.jsp" style="text-decoration: none">Quên mật khẩu?</a></h6>
						</div>
       <button class="w-full bg-green-600 text-white py-2 rounded-lg hover:bg-green-700" type="submit">
        Login
       </button>
      </form>
      <img alt="A colorful cartoon illustration of a pharmacy with happy characters and medicine shelves" class="mt-4 rounded-lg mx-auto" height="200" src="https://storage.googleapis.com/a1aa/image/pbiVshS98upsFZtQpzYpyfnT3U3qeNINBXQvmh8Yo1JsXH1TA.jpg" width="300"/>
     </div>
    </div>
    <!-- Register Form -->
    <div class="w-full md:w-1/2 px-4">
     <div class="bg-white p-6 rounded-lg shadow-lg border border-red-600">
      <h3 class="text-center text-2xl font-semibold mb-4">
       Register
      </h3>
      <form action="UsersRegisterServlet" method="post">
       <div class="mb-4">
        <label class="block text-gray-700" for="account">
         Username
        </label>
        <input class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600" id="account" name="user-name" placeholder="Username *" required="" type="text"/>
       </div>
       <div class="mb-4">
        <label class="block text-gray-700" for="pwd">
         Password
        </label>
        <input class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600" id="pwd" name="user-password" placeholder="Password *" required="" type="password"/>
       </div>
       <div class="mb-4">
        <label class="block text-gray-700" for="pwds">
         Confirm Password
        </label>
        <input class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600" id="pwds" name="user-passwordcf" placeholder="Confirm Password *" required="" type="password"/>
       </div>
       <div class="mb-4">
        <label class="block text-gray-700" for="email">
         Email Address
        </label>
        <input class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600" id="email" name="user-email" placeholder="Email *" required="" type="email"/>
       </div>
       <div class="mb-4">
        <label class="block text-gray-700" for="pwdss">
         Display Name
        </label>
        <input class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600" id="pwdss" name="user-showname" placeholder="Display Name *" required="" type="text"/>
       </div>
       <button class="w-full bg-red-600 text-white py-2 rounded-lg hover:bg-red-700" type="submit">
        Register
       </button>
      </form>
     </div>
    </div>
   </div>
  </div>
  <!-- Footer -->
  <footer class="bg-gray-800 text-white py-4 text-center">
   <p>
    © 2024 Web Nai Vàng Xin Chào.
   </p>
  </footer>
 </body>
</html>
