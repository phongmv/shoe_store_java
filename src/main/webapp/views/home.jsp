<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<%--Header--%>
<jsp:include page="./header.jsp"/>

<!-- Hero Section -->
<section class="bg-blue-600 text-white pt-20"></section>

<!-- Categories Section -->
<section class="py-16 bg-gray-100">
    <div class="container mx-auto px-4">
        <h2 class="text-3xl font-bold text-center mb-12">Shop by Category</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="bg-white rounded-lg shadow-md overflow-hidden text-center hover:shadow-lg transition ${selectedCategory eq 'Running' ? 'ring-2 ring-blue-500' : ''}">
                <img src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80"
                     alt="Running Shoes"
                     class="w-full h-48 object-cover"
                     onerror="this.src='https://via.placeholder.com/600x400?text=Running+Shoes'">
                <div class="p-6">
                    <h3 class="text-xl font-bold mb-4">Running</h3>
                    <a href="${pageContext.request.contextPath}/home?category=Running&page=1"
                       class="inline-block bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md transition">
                        View Collection
                    </a>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-md overflow-hidden text-center hover:shadow-lg transition ${selectedCategory eq 'Casual' ? 'ring-2 ring-blue-500' : ''}">
                <img src="https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=600"
                     alt="Casual Shoes"
                     class="w-full h-48 object-cover"
                     onerror="this.src='https://via.placeholder.com/600x400?text=Casual+Shoes'">
                <div class="p-6">
                    <h3 class="text-xl font-bold mb-4">Casual</h3>
                    <a href="${pageContext.request.contextPath}/home?category=Casual&page=1"
                       class="inline-block bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md transition">
                        View Collection
                    </a>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-md overflow-hidden text-center hover:shadow-lg transition ${selectedCategory eq 'Sneakers' ? 'ring-2 ring-blue-500' : ''}">
                <img src="https://cdn.pixabay.com/photo/2016/11/19/18/06/feet-1840619_960_720.jpg"
                     alt="Sneakers"
                     class="w-full h-48 object-cover"
                     onerror="this.src='https://via.placeholder.com/600x400?text=Sneakers'">
                <div class="p-6">
                    <h3 class="text-xl font-bold mb-4">Sneakers</h3>
                    <a href="${pageContext.request.contextPath}/home?category=Sneakers&page=1"
                       class="inline-block bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md transition">
                        View Collection
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Featured Products -->
<section class="py-16" id="featured">
    <div class="container mx-auto px-4">
        <div class="flex justify-between items-center mb-12">
            <h2 class="text-3xl font-bold">Featured Products</h2>
            <c:if test="${not empty selectedCategory}">
                <a href="${pageContext.request.contextPath}/home?page=1"
                   class="text-blue-600 hover:text-blue-800 flex items-center transition">
                    <i class="fas fa-times mr-1"></i> Clear Filter
                </a>
            </c:if>
        </div>

        <c:if test="${not empty selectedCategory}">
            <div class="mb-6 text-center">
                <span class="inline-block bg-blue-100 text-blue-800 px-4 py-2 rounded-full">
                    Showing: ${fn:toUpperCase(fn:substring(selectedCategory, 0, 1))}${fn:toLowerCase(fn:substring(selectedCategory, 1, -1))}
                </span>
            </div>
        </c:if>

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-8">
            <c:choose>
                <c:when test="${empty products}">
                    <div class="col-span-full text-center py-12">
                        <i class="fas fa-shoe-prints text-5xl text-gray-300 mb-4"></i>
                        <h3 class="text-xl font-semibold text-gray-600">No products found</h3>
                        <p class="text-gray-500 mt-2">
                            <c:choose>
                                <c:when test="${not empty selectedCategory}">
                                    No products in ${selectedCategory} category
                                </c:when>
                                <c:otherwise>
                                    Our inventory is currently empty
                                </c:otherwise>
                            </c:choose>
                        </p>
                        <a href="${pageContext.request.contextPath}/home?page=1"
                           class="inline-block mt-4 text-blue-600 hover:text-blue-800">
                            Browse all products
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${products}" var="product">
                        <a href="${pageContext.request.contextPath}/product-detail?id=${product.id}">
                        <div class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition duration-300 transform hover:-translate-y-1">
                            <div class="relative">
                                <img src="${not empty product.image ? 'data:image/jpeg;base64,'.concat(product.getImageBase64()) : 'https://via.placeholder.com/300x200?text=No+Image'}"
                                     alt="${product.name}"
                                     class="w-full h-48 object-cover"
                                     onerror="this.src='https://via.placeholder.com/300x200?text=Image+Error'">

                            </div>
                            <div class="p-4">
                                <h3 class="font-semibold text-lg mb-1 truncate">${product.name}</h3>
                                <p class="text-blue-600 font-bold mb-2">$${product.price}</p>
                                <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700">
                                        ${not empty product.category ? product.category : 'Uncategorized'}
                                </span>
                            </div>
                        </div>
                        </a>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Pagination -->
        <c:if test="${not empty totalPages and totalPages > 1}">
            <div class="flex justify-center mt-12">
                <nav class="flex items-center space-x-2">
                    <!-- Previous Button -->
                    <c:choose>
                        <c:when test="${currentPage > 1}">
                            <a href="${pageContext.request.contextPath}/${paginationUrl}${currentPage - 1}"
                               class="px-4 py-2 rounded-md bg-blue-600 text-white hover:bg-blue-700 transition flex items-center">
                                <i class="fas fa-chevron-left mr-1"></i> Previous
                            </a>
                        </c:when>
                        <c:otherwise>
                            <span class="px-4 py-2 rounded-md bg-gray-200 text-gray-500 cursor-not-allowed flex items-center">
                                <i class="fas fa-chevron-left mr-1"></i> Previous
                            </span>
                        </c:otherwise>
                    </c:choose>

                    <!-- Page Numbers -->
                    <div class="flex items-center space-x-1">
                        <c:set var="startPage" value="${currentPage - 2 > 1 ? currentPage - 2 : 1}" />
                        <c:set var="endPage" value="${currentPage + 2 < totalPages ? currentPage + 2 : totalPages}" />

                        <c:if test="${startPage > 1}">
                            <a href="${pageContext.request.contextPath}/${paginationUrl}1"
                               class="px-3 py-1 rounded-md bg-gray-200 hover:bg-gray-300 transition">
                                1
                            </a>
                            <c:if test="${startPage > 2}">
                                <span class="px-1">...</span>
                            </c:if>
                        </c:if>

                        <c:forEach begin="${startPage}" end="${endPage}" var="i">
                            <c:choose>
                                <c:when test="${i == currentPage}">
                                    <span class="px-3 py-1 rounded-md bg-blue-600 text-white">${i}</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/${paginationUrl}${i}"
                                       class="px-3 py-1 rounded-md bg-gray-200 hover:bg-gray-300 transition">
                                            ${i}
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:if test="${endPage < totalPages}">
                            <c:if test="${endPage < totalPages - 1}">
                                <span class="px-1">...</span>
                            </c:if>
                            <a href="${pageContext.request.contextPath}/${paginationUrl}${totalPages}"
                               class="px-3 py-1 rounded-md bg-gray-200 hover:bg-gray-300 transition">
                                    ${totalPages}
                            </a>
                        </c:if>
                    </div>

                    <!-- Next Button -->
                    <c:choose>
                        <c:when test="${currentPage < totalPages}">
                            <a href="${pageContext.request.contextPath}/${paginationUrl}${currentPage + 1}"
                               class="px-4 py-2 rounded-md bg-blue-600 text-white hover:bg-blue-700 transition flex items-center">
                                Next <i class="fas fa-chevron-right ml-1"></i>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <span class="px-4 py-2 rounded-md bg-gray-200 text-gray-500 cursor-not-allowed flex items-center">
                                Next <i class="fas fa-chevron-right ml-1"></i>
                            </span>
                        </c:otherwise>
                    </c:choose>
                </nav>
            </div>
        </c:if>
    </div>
</section>


<!-- Footer -->
<jsp:include page="./footer.jsp" />

</body>
</html>