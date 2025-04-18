<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Your Cart - Shoe Store</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-gray-100 flex flex-col justify-between">

<header class="bg-white shadow p-4 flex flex-col md:flex-row justify-between items-center">
  <h1 class="text-2xl font-bold text-gray-800 mb-2 md:mb-0">Your Shopping Cart</h1>
  <nav class="space-x-4 text-blue-600">
    <a href="${pageContext.request.contextPath}/home" class="hover:underline">Home</a>
    <c:if test="${not empty sessionScope.user}">
      <a href="${pageContext.request.contextPath}/auth/logout" class="hover:underline">Logout</a>
    </c:if>
    <c:if test="${empty sessionScope.user}">
      <a href="${pageContext.request.contextPath}/auth/login" class="hover:underline">Login</a>
    </c:if>
  </nav>
</header>

<main class="flex-grow p-6 flex flex-col items-center">
  <div class="w-full max-w-5xl bg-white shadow rounded-lg p-6">
    <c:choose>
      <c:when test="${empty sessionScope.cart}">
        <p class="text-gray-600 text-center">Your cart is empty.</p>
      </c:when>
      <c:otherwise>
        <div class="overflow-x-auto">
          <table class="w-full table-auto text-left text-sm text-gray-600">
            <thead class="bg-gray-100">
            <tr>
              <th class="px-4 py-2">Product</th>
              <th class="px-4 py-2">Price</th>
              <th class="px-4 py-2">Quantity</th>
              <th class="px-4 py-2">Total</th>
              <th class="px-4 py-2">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${sessionScope.cart}" var="item">
              <tr class="border-b">
                <td class="px-4 py-2">${item.product.name}</td>
                <td class="px-4 py-2">$${item.product.price}</td>
                <td class="px-4 py-2">
                  <form action="${pageContext.request.contextPath}/cart/update" method="post" class="flex items-center space-x-2">
                    <input type="hidden" name="productId" value="${item.product.id}">
                    <input type="number" name="quantity" value="${item.quantity}" min="1"
                           class="w-16 px-2 py-1 border border-gray-300 rounded focus:ring-2 focus:ring-blue-500 focus:outline-none">
                    <button type="submit" class="px-3 py-1 bg-blue-600 text-white rounded hover:bg-blue-700 text-xs">Update</button>
                  </form>
                </td>
                <td class="px-4 py-2">$${item.getTotalPrice()}</td>
                <td class="px-4 py-2">
                  <form action="${pageContext.request.contextPath}/cart/remove" method="post">
                    <input type="hidden" name="productId" value="${item.product.id}">
                    <button type="submit" class="px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600 text-xs">Remove</button>
                  </form>
                </td>
              </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr class="bg-gray-100 font-semibold">
              <td colspan="3" class="px-4 py-2 text-right">Total:</td>
              <td class="px-4 py-2">
                <c:set var="total" value="0" />
                <c:forEach items="${sessionScope.cart}" var="item">
                  <c:set var="total" value="${total + item.getTotalPrice()}" />
                </c:forEach>
                $${total}
              </td>
              <td></td>
            </tr>
            </tfoot>
          </table>
        </div>

        <div class="mt-6 flex flex-col items-center space-y-4">
          <c:if test="${not empty sessionScope.user}">
            <form action="${pageContext.request.contextPath}/checkout" method="post">
              <button type="submit" class="w-full md:w-auto bg-green-600 text-white px-6 py-2 rounded hover:bg-green-700 transition">Proceed to Checkout</button>
            </form>
          </c:if>
          <c:if test="${empty sessionScope.user}">
            <p class="text-gray-600">Please <a href="${pageContext.request.contextPath}/auth/login" class="text-blue-600 hover:underline">login</a> to proceed to checkout.</p>
          </c:if>
        </div>
      </c:otherwise>
    </c:choose>
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
