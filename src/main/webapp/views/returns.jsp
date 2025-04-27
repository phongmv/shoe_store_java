<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Returns & Exchanges Policy - Shoe Store</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body class="bg-white text-gray-800">
<%--Header--%>
<jsp:include page="header.jsp"/>

<main class="max-w-6xl mx-auto px-4 py-10 space-y-6 pt-32 h-screen">
    <section>
        <h2 class="text-2xl font-semibold text-blue-600 mb-2">Return Conditions</h2>
        <p class="text-gray-600">
            Items can be returned within 7 days of receiving the order. Products must be unused, unwashed, and returned in their original packaging.
        </p>
    </section>

    <section>
        <h2 class="text-2xl font-semibold text-blue-600 mb-2">Exchange Policy</h2>
        <p class="text-gray-600">
            You may exchange products for another size or style if available. Exchanges must also meet the return conditions.
        </p>
    </section>

    <section>
        <h2 class="text-2xl font-semibold text-blue-600 mb-2">Return Process</h2>
        <ol class="list-decimal list-inside text-gray-600 space-y-1">
            <li>Contact our customer service team via email or phone to initiate a return.</li>
            <li>Package the items securely and send them to our return address.</li>
            <li>Once we receive and inspect your return, we will process the refund or exchange.</li>
        </ol>
    </section>

    <section>
        <h2 class="text-2xl font-semibold text-blue-600 mb-2">Refunds</h2>
        <p class="text-gray-600">
            Refunds will be processed to your original payment method within 3-5 business days after we receive your return.
        </p>
    </section>
</main>
</body>


<!-- Footer -->
<jsp:include page="./footer.jsp" />

</html>
