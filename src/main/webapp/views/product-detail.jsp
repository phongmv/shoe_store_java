<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Shoe Store - ${product.name}</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body class="bg-gray-50">
<!-- Header -->
<header class="bg-white shadow-md">
  <div class="container mx-auto px-4 py-4 flex justify-between items-center">
    <div class="text-2xl font-bold text-blue-600">ShoeStore</div>
    <nav class="flex items-center space-x-4">
      <c:if test="${not empty sessionScope.user}">
                <span class="flex items-center text-gray-700">
                    <i class="fas fa-user mr-1"></i> ${sessionScope.user.fullName}
                </span>
        <a href="${pageContext.request.contextPath}/auth/logout" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md transition">
          <i class="fas fa-sign-out-alt mr-1"></i> Logout
        </a>
      </c:if>
      <c:if test="${empty sessionScope.user}">
        <a href="${pageContext.request.contextPath}/auth/login" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md transition">
          <i class="fas fa-sign-in-alt mr-1"></i> Login
        </a>
        <a href="${pageContext.request.contextPath}/auth/register" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md transition">
          <i class="fas fa-user-plus mr-1"></i> Register
        </a>
      </c:if>
      <a href="${pageContext.request.contextPath}/cart" class="relative bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md transition">
        <i class="fas fa-shopping-cart mr-1"></i> Cart
        <c:if test="${not empty sessionScope.cart}">
                    <span class="absolute -top-2 -right-2 bg-red-500 text-white text-xs rounded-full h-5 w-5 flex items-center justify-center">
                        ${fn:length(sessionScope.cart)}
                    </span>
        </c:if>
      </a>
    </nav>
  </div>
</header>

<!-- Product Detail Section -->
<section class="py-12">
  <div class="container mx-auto px-4">
    <div class="max-w-6xl mx-auto">
      <!-- Breadcrumb -->
      <div class="flex items-center text-sm text-gray-500 mb-6">
        <a href="${pageContext.request.contextPath}/home" class="hover:text-blue-600">Home</a>
        <span class="mx-2">/</span>
        <a href="${pageContext.request.contextPath}/home?category=${product.category}" class="hover:text-blue-600">${product.category}</a>
        <span class="mx-2">/</span>
        <span class="text-gray-400">${product.name}</span>
      </div>

      <div class="flex flex-col md:flex-row gap-8">
        <!-- Product Image -->
        <div class="md:w-1/2">
          <div class="bg-white rounded-lg shadow-md overflow-hidden">
            <img src="${not empty product.imageUrl ? product.imageUrl : 'https://via.placeholder.com/800x600?text=No+Image'}"
                 alt="${product.name}"
                 class="w-full h-auto object-cover"
                 onerror="this.src='https://via.placeholder.com/800x600?text=Image+Error'">
          </div>
        </div>

        <!-- Product Info -->
        <div class="md:w-1/2">
          <div class="bg-white rounded-lg shadow-md p-6">
            <h1 class="text-3xl font-bold mb-2">${product.name}</h1>
            <div class="flex items-center mb-4">
              <span class="text-blue-600 text-2xl font-bold">$${product.price}</span>
              <c:if test="${product.stock > 0}">
                                <span class="ml-4 text-green-600 text-sm bg-green-100 px-2 py-1 rounded">
                                    <i class="fas fa-check-circle mr-1"></i> In Stock (${product.stock} available)
                                </span>
              </c:if>
              <c:if test="${product.stock <= 0}">
                                <span class="ml-4 text-red-600 text-sm bg-red-100 px-2 py-1 rounded">
                                    <i class="fas fa-times-circle mr-1"></i> Out of Stock
                                </span>
              </c:if>
            </div>

            <div class="mb-6">
                            <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700">
                              ${product.category}
                            </span>
            </div>

            <p class="text-gray-700 mb-6">${product.description}</p>

            <!-- Add to Cart Form -->
            <form action="${pageContext.request.contextPath}/cart/add" method="post" class="mb-6">
              <input type="hidden" name="productId" value="${product.id}">
              <div class="flex items-center mb-4">
                <label for="quantity" class="mr-4 font-medium">Quantity:</label>
                <input type="number" id="quantity" name="quantity" value="1" min="1"
                       max="${product.stock > 0 ? product.stock : 1}"
                       class="w-20 px-3 py-2 border border-gray-300 rounded-md">
              </div>
              <button type="submit"
                      class="w-full bg-blue-600 hover:bg-blue-700 text-white py-3 px-6 rounded-md font-medium transition flex items-center justify-center"
              ${product.stock <= 0 ? 'disabled' : ''}>
                <i class="fas fa-cart-plus mr-2"></i> Add to Cart
              </button>
            </form>

            <!-- Back to Products Link -->
            <a href="${pageContext.request.contextPath}/home"
               class="inline-block text-blue-600 hover:text-blue-800 transition">
              <i class="fas fa-arrow-left mr-1"></i> Back to Products
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<footer class="bg-gray-800 text-white py-12">
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
</body>
</html>