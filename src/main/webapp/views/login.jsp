<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Shoe Store</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-gray-100 flex flex-col justify-between">
<header class="bg-white shadow p-4 flex justify-between items-center">
    <h1 class="text-2xl font-bold text-gray-800">Login</h1>
    <nav class="space-x-4">
        <a href="${pageContext.request.contextPath}/home" class="text-blue-600 hover:underline">Home</a>
        <a href="${pageContext.request.contextPath}/auth/register" class="text-blue-600 hover:underline">Register</a>
    </nav>
</header>

<main class="flex-grow flex justify-center items-center px-4">
    <form action="${pageContext.request.contextPath}/auth/login" method="post"
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
        <button type="submit"
                class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700 transition">Login</button>
    </form>
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
