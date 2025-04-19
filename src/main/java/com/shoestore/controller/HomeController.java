package com.shoestore.controller;

import com.shoestore.model.Product;
import com.shoestore.service.ProductService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = {"/home", "/home/*"})
public class HomeController extends HttpServlet {
    private ProductService productService;
    private static final int PRODUCTS_PER_PAGE = 8;

    @Override
    public void init() throws ServletException {
        this.productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get page number safely without reassigning parameter
        final int currentPage = getPageNumber(request);

        // Get paginated data
        PaginationData paginationData = getPaginationData(currentPage);

        // Set request attributes
        request.setAttribute("products", paginationData.getProducts());
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", paginationData.getTotalPages());

        request.getRequestDispatcher("/views/home.jsp").forward(request, response);
    }

    private int getPageNumber(HttpServletRequest request) {
        try {
            String pageParam = request.getParameter("page");
            if (pageParam != null && !pageParam.isEmpty()) {
                int page = Integer.parseInt(pageParam);
                return Math.max(1, page); // Ensure page is at least 1
            }
        } catch (NumberFormatException e) {
            // Log error if needed
        }
        return 1; // Default to first page
    }

    private PaginationData getPaginationData(int currentPage) {
        List<Product> products = productService.getProductsByPage(currentPage, PRODUCTS_PER_PAGE);
        int totalProducts = productService.getTotalProducts();
        int totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);

        return new PaginationData(products, totalPages);
    }

    // Helper class to hold pagination data
    private static class PaginationData {
        private final List<Product> products;
        private final int totalPages;

        public PaginationData(List<Product> products, int totalPages) {
            this.products = products;
            this.totalPages = totalPages;
        }

        public List<Product> getProducts() {
            return products;
        }

        public int getTotalPages() {
            return totalPages;
        }
    }
}