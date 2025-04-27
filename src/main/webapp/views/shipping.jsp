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
<%--Header--%>
<jsp:include page="header.jsp"/>

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
<jsp:include page="./footer.jsp" />
</html>
