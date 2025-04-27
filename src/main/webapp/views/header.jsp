<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<header class="bg-white shadow-md fixed top-0 w-screen z-[999]">
    <div class="container mx-auto px-4 py-4 flex justify-between items-center">
        <div class="text-2xl font-bold text-blue-600">
            <a href="${pageContext.request.contextPath}/home">
                Shoe Store
            </a>
        </div>
        <nav class="flex items-center space-x-4">

            <c:if test="${not empty sessionScope.user}">
                 <span class="flex items-center text-gray-700 border-b border-gray-300 px-4 py-2">
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
            <a href="${pageContext.request.contextPath}/product-new"
               class="bg-gray-600 hover:bg-gray-700 text-white px-4 py-2 rounded-md transition">
                <i class="fas fa-plus-circle mr-1"></i> Add Product
            </a>
        </nav>
    </div>
</header>