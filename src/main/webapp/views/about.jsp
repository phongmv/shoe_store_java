<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us - Shoe Store</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body class="bg-white text-gray-800">
<header class="bg-blue-600 text-white py-6 shadow-md fixed top-0 w-screen">
    <div class="max-w-6xl mx-auto px-4">
        <h1 class="text-3xl font-bold">About Shoe Store</h1>
    </div>
</header>

<main class="max-w-6xl mx-auto px-4 pt-32 h-screen">
    <section class="mb-12">
        <h2 class="text-4xl font-extrabold text-blue-600 mb-4">Who We Are</h2>
        <p class="text-lg text-gray-600 leading-relaxed mb-6">
            Shoe Store is a modern footwear brand dedicated to bringing you comfort, confidence, and style in every step. Founded by a team of passionate designers and shoe-lovers, we have grown into a trusted name for fashion-forward and functional footwear.
        </p>
        <img src="https://images.unsplash.com/photo-1519741491150-1fa0d1e689f3?auto=format&fit=crop&w=1350&q=80" alt="Team Working" class="rounded-lg shadow-md w-full max-h-[400px] object-cover mb-6">
        <p class="text-gray-600">
            With a global customer base, we continuously evolve to meet your needs – blending innovative design, sustainable practices, and superior craftsmanship.
        </p>
    </section>

    <section class="mb-12">
        <h2 class="text-3xl font-semibold text-gray-800 mb-4">Our Mission</h2>
        <p class="text-gray-600 leading-relaxed">
            To inspire and empower individuals through every step they take, by providing high-quality shoes that combine elegance, comfort, and performance.
        </p>
    </section>

    <section class="grid md:grid-cols-2 gap-8">
        <div>
            <h3 class="text-2xl font-semibold text-blue-600 mb-2">Quality & Craftsmanship</h3>
            <p class="text-gray-600">Each pair is meticulously crafted using premium materials sourced from ethical suppliers.</p>
        </div>
        <div>
            <h3 class="text-2xl font-semibold text-blue-600 mb-2">Innovation</h3>
            <p class="text-gray-600">We embrace modern technology to improve fit, comfort, and sustainability across our product line.</p>
        </div>
        <div>
            <h3 class="text-2xl font-semibold text-blue-600 mb-2">Customer Commitment</h3>
            <p class="text-gray-600">Our support team is here for you — whether it’s product advice, size guidance, or order issues.</p>
        </div>
        <div>
            <h3 class="text-2xl font-semibold text-blue-600 mb-2">Sustainability</h3>
            <p class="text-gray-600">We aim to reduce our carbon footprint through eco-friendly packaging and material choices.</p>
        </div>
    </section>
</main>

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
</body>
</html>
