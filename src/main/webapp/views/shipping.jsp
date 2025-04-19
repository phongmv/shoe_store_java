<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shipping Policy - Shoe Store</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-white text-gray-800">
<header class="bg-blue-600 text-white py-6 shadow-md fixed top-0 w-screen">
    <div class="max-w-6xl mx-auto px-4">
        <h1 class="text-3xl font-bold">Shipping Policy</h1>
    </div>
</header>

<main class="max-w-6xl mx-auto px-4 py-10 space-y-6 pt-32 h-screen">
    <section>
        <h2 class="text-2xl font-semibold text-blue-600 mb-2">Order Processing Time</h2>
        <p class="text-gray-600">Orders will be processed within 1-2 business days after payment is received.</p>
    </section>

    <section>
        <h2 class="text-2xl font-semibold text-blue-600 mb-2">Shipping Methods</h2>
        <ul class="list-disc list-inside text-gray-600">
            <li>Standard Shipping (3-5 business days)</li>
            <li>Express Shipping (1-2 business days)</li>
            <li>Same-day Delivery (Available in Ho Chi Minh City only)</li>
        </ul>
    </section>

    <section>
        <h2 class="text-2xl font-semibold text-blue-600 mb-2">Shipping Fees</h2>
        <p class="text-gray-600">Free shipping for orders over 500,000₫. Orders below this amount will incur a shipping fee of 30,000₫.</p>
    </section>

    <section>
        <h2 class="text-2xl font-semibold text-blue-600 mb-2">Order Tracking</h2>
        <p class="text-gray-600">Once your order is shipped, you will receive an email with a tracking number to follow your delivery status.</p>
    </section>
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
