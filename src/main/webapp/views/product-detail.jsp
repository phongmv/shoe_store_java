<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Shoe Store - ${product.name}</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body class="bg-gray-50">
<%--Header--%>
<jsp:include page="header.jsp"/>

<!-- Product Detail Section -->
<section class="pt-[80px] h-[700px]">
  <div class="container mx-auto px-4">
    <div class="max-w-6xl mx-auto">
      <!-- Breadcrumb -->
      <div class="flex items-center text-sm text-gray-500 mb-6">
        <a href="${pageContext.request.contextPath}/home" class="hover:text-blue-600">Home</a>
        <span class="mx-2">/</span>
        <a href="${pageContext.request.contextPath}/home?category=${product.category}" class="hover:text-blue-600">${product.category}</a>
        <span class="mx-2">/</span>
        <span class="text-gray-400">${product.name}</span>
      </div>

      <div class="flex flex-col md:flex-row gap-8">
        <!-- Product Image -->
        <div class="md:w-1/2">
          <div class="bg-white rounded-lg shadow-md overflow-hidden">
            <img src="${not empty product.image ? 'data:image/jpeg;base64,'.concat(product.getImageBase64()) : 'https://via.placeholder.com/800x600?text=No+Image'}"
                 alt="${product.name}"
                 class="w-full h-auto object-cover max-h-[400px]"
                 onerror="this.src='https://via.placeholder.com/800x600?text=Image+Error'">
          </div>
        </div>

        <!-- Product Info -->
        <div class="md:w-1/2">
          <div class="bg-white rounded-lg shadow-md p-6">
            <h1 class="text-3xl font-bold mb-2">${product.name}</h1>
            <div class="flex items-center mb-4">
              <span class="text-blue-600 text-2xl font-bold">$${product.price}</span>
              <c:if test="${product.stock > 0}">
                                <span class="ml-4 text-green-600 text-sm bg-green-100 px-2 py-1 rounded">
                                    <i class="fas fa-check-circle mr-1"></i> In Stock (${product.stock} available)
                                </span>
              </c:if>
              <c:if test="${product.stock <= 0}">
                                <span class="ml-4 text-red-600 text-sm bg-red-100 px-2 py-1 rounded">
                                    <i class="fas fa-times-circle mr-1"></i> Out of Stock
                                </span>
              </c:if>
            </div>

            <div class="mb-6">
                            <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700">
                              ${product.category}
                            </span>
            </div>

            <p class="text-gray-700 mb-6">${product.description}</p>

            <!-- Add to Cart Form -->
            <form action="${pageContext.request.contextPath}/cart/add" method="post" class="mb-6">
              <input type="hidden" name="productId" value="${product.id}">
              <div class="flex items-center mb-4">
                <label for="quantity" class="mr-4 font-medium">Quantity:</label>
                <input type="number" id="quantity" name="quantity" value="1" min="1"
                       max="${product.stock > 0 ? product.stock : 1}"
                       class="w-20 px-3 py-2 border border-gray-300 rounded-md">
              </div>
              <button type="submit"
                      class="w-full text-white py-3 px-6 rounded-md font-medium transition flex items-center justify-center
              ${product.stock <= 0 ? 'disabled bg-gray-600' : 'bg-blue-600'}">
                <i class="fas fa-cart-plus mr-2"></i> Add to Cart
              </button>
            </form>

            <!-- Back to Products Link -->
            <a href="${pageContext.request.contextPath}/home"
               class="inline-block text-blue-600 hover:text-blue-800 transition">
              <i class="fas fa-arrow-left mr-1"></i> Back to Products
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>

<!-- Footer -->
<jsp:include page="./footer.jsp" />

</html>