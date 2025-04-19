<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Register - Shoe Store</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body class="min-h-screen bg-gray-100 flex flex-col justify-between">
<header class="bg-white shadow p-4 flex justify-between items-center fixed top-0 w-screen">
  <h1 class="text-2xl font-bold text-gray-800">Register</h1>
  <nav class="space-x-4">
    <a href="${pageContext.request.contextPath}/home" class="text-blue-600 hover:underline">Home</a>
    <a href="${pageContext.request.contextPath}/auth/login" class="text-blue-600 hover:underline">Login</a>
  </nav>
</header>

<main class="flex-grow flex justify-center items-center px-4 pt-32 h-screen">
  <form action="${pageContext.request.contextPath}/auth/register" method="post"
        class="bg-white p-8 rounded shadow-md w-full max-w-md space-y-6">
    <c:if test="${not empty error}">
      <p class="text-red-500 text-sm font-medium">${error}</p>
    </c:if>
    <div>
      <label for="username" class="block text-gray-700 font-semibold mb-2">Username:</label>
      <input type="text" id="username" name="username" required
             class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500">
    </div>
    <div>
      <label for="password" class="block text-gray-700 font-semibold mb-2">Password:</label>
      <input type="password" id="password" name="password" required
             class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500">
    </div>
    <div>
      <label for="email" class="block text-gray-700 font-semibold mb-2">Email:</label>
      <input type="email" id="email" name="email" required
             class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500">
    </div>
    <div>
      <label for="fullName" class="block text-gray-700 font-semibold mb-2">Full Name:</label>
      <input type="text" id="fullName" name="fullName" required
             class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500">
    </div>
    <div>
      <label for="address" class="block text-gray-700 font-semibold mb-2">Address:</label>
      <input type="text" id="address" name="address" required
             class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500">
    </div>
    <div>
      <label for="phone" class="block text-gray-700 font-semibold mb-2">Phone:</label>
      <input type="tel" id="phone" name="phone" required
             class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500">
    </div>
    <button type="submit"
            class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700 transition">Register</button>
  </form>
</main>
</body>

<!-- Footer -->
<footer class="bg-gray-800 text-white py-8">
  <div class="container mx-auto px-4">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
      <div>
        <h3 class="text-xl font-bold mb-4">Quick Links</h3>
        <ul class="space-y-2">
          <li><a href="${pageContext.request.contextPath}/home" class="hover:text-blue-400 transition">Home</a></li>
          <li><a href="${pageContext.request.contextPath}/about" class="hover:text-blue-400 transition">About Us</a></li>
          <li><a href="${pageContext.request.contextPath}/contact" class="hover:text-blue-400 transition">Contact</a></li>
        </ul>
      </div>
      <div>
        <h3 class="text-xl font-bold mb-4">Customer Service</h3>
        <ul class="space-y-2">
          <li><a href="${pageContext.request.contextPath}/shipping" class="hover:text-blue-400 transition">Shipping Policy</a></li>
          <li><a href="${pageContext.request.contextPath}/returns" class="hover:text-blue-400 transition">Returns & Exchanges</a></li>
        </ul>
      </div>
      <div>
        <h3 class="text-xl font-bold mb-4">Connect With Us</h3>
        <div class="flex space-x-4">
          <a href="https://www.facebook.com/login" target="_blank" rel="noopener noreferrer" class="text-2xl hover:text-blue-400 transition">
            <i class="fab fa-facebook-f"></i>
          </a>
          <a href="https://www.instagram.com/accounts/login/" target="_blank" rel="noopener noreferrer" class="text-2xl hover:text-blue-400 transition">
            <i class="fab fa-instagram"></i>
          </a>
          <a href="https://twitter.com/login" target="_blank" rel="noopener noreferrer" class="text-2xl hover:text-blue-400 transition">
            <i class="fab fa-twitter"></i>
          </a>
          <a href="https://www.pinterest.com/login/" target="_blank" rel="noopener noreferrer" class="text-2xl hover:text-blue-400 transition">
            <i class="fab fa-pinterest"></i>
          </a>
        </div>
      </div>
    </div>
    <div class="border-t border-gray-700 mt-8 pt-8 text-center">
      <p>&copy; <script>document.write(new Date().getFullYear())</script> ShoeStore. All rights reserved.</p>
    </div>
  </div>
</footer>
</html>
