<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shoe Store - Home</title>
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
                                ${sessionScope.cart.size()}
                        </span>
                </c:if>
            </a>
        </nav>
    </div>
</header>

<!-- Hero Section -->
<section class="bg-blue-600 text-white py-20">
    <div class="container mx-auto px-4 text-center">
        <h2 class="text-4xl font-bold mb-4">Step Into Comfort & Style</h2>
        <p class="text-xl mb-8">Discover our premium collection of footwear designed for every occasion</p>
        <a href="#featured" class="inline-block bg-white text-blue-600 hover:bg-gray-100 px-6 py-3 rounded-md font-medium transition">
            Shop Collection
        </a>
    </div>
</section>

<!-- Featured Products -->
<section class="py-16" id="featured">
    <div class="container mx-auto px-4">
        <h2 class="text-3xl font-bold text-center mb-12">Featured Products</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-8">
            <c:forEach items="${products}" var="product">
                <div class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition">
                    <div class="relative">
                        <img src="${pageContext.request.contextPath}/images/products/${product.imageUrl}" alt="${product.name}" class="w-full h-48 object-cover">
                        <div class="absolute bottom-2 left-0 right-0 flex justify-center space-x-2">
                            <a href="${pageContext.request.contextPath}/cart/add?productId=${product.id}" class="bg-blue-600 hover:bg-blue-700 text-white p-2 rounded-full transition">
                                <i class="fas fa-cart-plus"></i>
                            </a>
                            <a href="${pageContext.request.contextPath}/product-detail?id=${product.id}" class="bg-gray-800 hover:bg-gray-900 text-white p-2 rounded-full transition">
                                <i class="fas fa-eye"></i>
                            </a>
                        </div>
                    </div>
                    <div class="p-4">
                        <h3 class="font-semibold text-lg mb-1">${product.name}</h3>
                        <p class="text-blue-600 font-bold mb-2">$${product.price}</p>
                        <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700">
                                ${product.category}
                        </span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<!-- Categories Section -->
<section class="py-16 bg-gray-100">
    <div class="container mx-auto px-4">
        <h2 class="text-3xl font-bold text-center mb-12">Shop by Category</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="bg-white rounded-lg shadow-md overflow-hidden text-center">
                <img src="${pageContext.request.contextPath}/images/running.jpg" alt="Running Shoes" class="w-full h-48 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-bold mb-4">Running</h3>
                    <a href="${pageContext.request.contextPath}/home?category=running" class="inline-block bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md transition">
                        View Collection
                    </a>
                </div>
            </div>
            <div class="bg-white rounded-lg shadow-md overflow-hidden text-center">
                <img src="${pageContext.request.contextPath}/images/casual.jpg" alt="Casual Shoes" class="w-full h-48 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-bold mb-4">Casual</h3>
                    <a href="${pageContext.request.contextPath}/home?category=casual" class="inline-block bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md transition">
                        View Collection
                    </a>
                </div>
            </div>
            <div class="bg-white rounded-lg shadow-md overflow-hidden text-center">
                <img src="${pageContext.request.contextPath}/images/sneakers.jpg" alt="Sneakers" class="w-full h-48 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-bold mb-4">Sneakers</h3>
                    <a href="${pageContext.request.contextPath}/home?category=sneakers" class="inline-block bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md transition">
                        View Collection
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

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