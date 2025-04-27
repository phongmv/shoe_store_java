<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Your Cart - Shoe Store</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body class="min-h-screen bg-gray-100 flex flex-col justify-between">

<%--Header--%>
<jsp:include page="header.jsp"/>

<main class="flex-grow p-6 flex flex-col items-center pt-32 h-screen">
  <div class="w-full max-w-5xl bg-white shadow rounded-lg p-6">
    <c:choose>
      <c:when test="${empty sessionScope.cart}">
        <p class="text-gray-600 text-center">Your cart is empty.</p>
      </c:when>
      <c:otherwise>
        <div class="overflow-x-auto">
          <table class="w-full table-auto text-left text-sm text-gray-600">
            <thead class="bg-gray-100">
            <tr>
              <th class="px-4 py-2">Product</th>
              <th class="px-4 py-2">Price</th>
              <th class="px-4 py-2">Quantity</th>
              <th class="px-4 py-2">Total</th>
              <th class="px-4 py-2">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${sessionScope.cart}" var="item">
              <tr class="border-b">
                <td class="px-4 py-2">${item.product.name}</td>
                <td class="px-4 py-2">$${item.product.price}</td>
                <td class="px-4 py-2">
                  <form action="${pageContext.request.contextPath}/cart/update" method="post" class="flex items-center space-x-2">
                    <input type="hidden" name="productId" value="${item.product.id}">
                    <input type="number" name="quantity" value="${item.quantity}" min="1"
                           class="w-16 px-2 py-1 border border-gray-300 rounded focus:ring-2 focus:ring-blue-500 focus:outline-none">
                    <button type="submit" class="px-3 py-1 bg-blue-600 text-white rounded hover:bg-blue-700 text-xs">Update</button>
                  </form>
                </td>
                <td class="px-4 py-2">$${item.getTotalPrice()}</td>
                <td class="px-4 py-2">
                  <form action="${pageContext.request.contextPath}/cart/remove" method="post">
                    <input type="hidden" name="productId" value="${item.product.id}">
                    <button type="submit" class="px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600 text-xs">Remove</button>
                  </form>
                </td>
              </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr class="bg-gray-100 font-semibold">
              <td colspan="3" class="px-4 py-2 text-right">Total:</td>
              <td class="px-4 py-2">
                <c:set var="total" value="0" />
                <c:forEach items="${sessionScope.cart}" var="item">
                  <c:set var="total" value="${total + item.getTotalPrice()}" />
                </c:forEach>
                $${total}
              </td>
              <td></td>
            </tr>
            </tfoot>
          </table>
        </div>
      </c:otherwise>
    </c:choose>
  </div>
</main>

<!-- Footer -->
<jsp:include page="./footer.jsp" />
</body>
</html>
