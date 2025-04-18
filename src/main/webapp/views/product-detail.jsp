<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>${product.name} - Shoe Store</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-gray-100 flex flex-col justify-between">

<header class="bg-white shadow p-4 flex flex-col md:flex-row justify-between items-center">
  <h1 class="text-2xl font-bold text-gray-800 mb-2 md:mb-0">${product.name}</h1>
  <nav class="space-x-4 text-blue-600">
    <a href="${pageContext.request.contextPath}/home" class="hover:underline">Home</a>
    <c:if test="${not empty sessionScope.user}">
      <a href="${pageContext.request.contextPath}/auth/logout" class="hover:underline">Logout</a>
    </c:if>
    <c:if test="${empty sessionScope.user}">
      <a href="${pageContext.request.contextPath}/auth/login" class="hover:underline">Login</a>
    </c:if>
    <a href="${pageContext.request.contextPath}/cart" class="hover:underline">Cart</a>
  </nav>
</header>

<main class="flex-grow flex justify-center items-start p-6">
  <div class="bg-white shadow rounded-lg p-6 w-full max-w-4xl flex flex-col md:flex-row gap-8">
    <div class="w-full md:w-1/2">
      <img src="${product.imageUrl}" alt="${product.name}" class="w-full h-auto object-cover rounded">
    </div>
    <div class="w-full md:w-1/2 space-y-4">
      <h2 class="text-2xl font-semibold text-gray-800">${product.name}</h2>
      <p class="text-xl text-green-600 font-bold">$${product.price}</p>
      <p class="text-gray-600">${product.description}</p>
      <p class="text-sm text-gray-500">In stock: ${product.stock}</p>

      <form action="${pageContext.request.contextPath}/cart/add" method="post" class="space-y-4">
        <input type="hidden" name="productId" value="${product.id}">
        <div>
          <label for="quantity" class="block text-sm font-medium text-gray-700 mb-1">Quantity:</label>
          <input type="number" id="quantity" name="quantity" value="1" min="1" max="${product.stock}"
                 class="w-24 px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>
        <button type="submit"
                class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700 transition">Add to Cart</button>
      </form>
    </div>
  </div>
</main>
<!-- Footer -->
<footer class="bg-gray-800 text-white py-12">
  <div class="container mx-auto px-4">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
      <div class="footer-section">
        <h3 class="text-xl font-bold mb-4">Quick Links</h3>
        <ul class="space-y-2">
          <li><a href="${pageContext.request.contextPath}/home" class="hover:text-blue-400 transition">Home</a></li>
          <li><a href="${pageContext.request.contextPath}/about" class="hover:text-blue-400 transition">About Us</a></li>
          <li><a href="${pageContext.request.contextPath}/contact" class="hover:text-blue-400 transition">Contact</a></li>
        </ul>
      </div>
      <div class="footer-section">
        <h3 class="text-xl font-bold mb-4">Customer Service</h3>
        <ul class="space-y-2">
          <li><a href="${pageContext.request.contextPath}/shipping" class="hover:text-blue-400 transition">Shipping Policy</a></li>
          <li><a href="${pageContext.request.contextPath}/returns" class="hover:text-blue-400 transition">Returns & Exchanges</a></li>
        </ul>
      </div>
      <div class="footer-section">
        <h3 class="text-xl font-bold mb-4">Connect With Us</h3>
        <div class="flex space-x-4">
          <a href="https://www.facebook.com/login" target="_blank" class="text-2xl hover:text-blue-400 transition">
            <i class="fab fa-facebook-f"></i>
          </a>
          <a href="https://www.instagram.com/accounts/login/" target="_blank" class="text-2xl hover:text-blue-400 transition">
            <i class="fab fa-instagram"></i>
          </a>
          <a href="https://twitter.com/login" target="_blank" class="text-2xl hover:text-blue-400 transition">
            <i class="fab fa-twitter"></i>
          </a>
          <a href="https://www.pinterest.com/login/" target="_blank" class="text-2xl hover:text-blue-400 transition">
            <i class="fab fa-pinterest"></i>
          </a>

        </div>
      </div>
    </div>
    <div class="border-t border-gray-700 mt-8 pt-8 text-center">
      <p>&copy; 2023 ShoeStore. All rights reserved.</p>
    </div>
  </div>
</footer>

</body>
</html>
