<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login - Shoe Store</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body class="min-h-screen bg-gray-100 flex flex-col justify-between">
<%--Header--%>
<header class="bg-white shadow-md fixed top-0 w-screen z-[999]">
    <div class="container mx-auto px-4 py-4 flex justify-between items-center">
        <div class="text-2xl font-bold text-blue-600">
            <a href="${pageContext.request.contextPath}/home">
                Shoe Store
            </a>
        </div>
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
                <a href="${pageContext.request.contextPath}/auth/register" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md transition">
                    <i class="fas fa-user-plus mr-1"></i> Register
                </a>
            </c:if>
        </nav>
    </div>
</header>

<main class="flex-grow flex justify-center items-center px-4 pt-32 h-screen">
    <form action="${pageContext.request.contextPath}/auth/login" method="post"
          class="bg-white p-8 rounded shadow-md w-full max-w-md space-y-6">
        <c:if test="${not empty error}">
            <p class="text-red-500 text-sm font-medium">${error}</p>
        </c:if>
        <div class="mx-auto text-center text-2xl font-bold">
            <i class="fas fa-sign-in-alt mr-1"></i>
           Login
        </div>
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
</body>

<!-- Footer -->
<jsp:include page="./footer.jsp" />

</html>
