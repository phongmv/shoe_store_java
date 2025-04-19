package com.shoestore.controller;

import com.shoestore.model.Product;
import com.shoestore.service.ProductService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
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

        String category = request.getParameter("category");
        int page = getPageNumber(request);

        List<Product> products;
        int totalProducts;

        if (category != null && !category.isEmpty()) {
            products = productService.getProductsByCategoryAndPage(category, page, PRODUCTS_PER_PAGE);
            totalProducts = productService.getTotalProductsByCategory(category);
            request.setAttribute("selectedCategory", category);
        } else {
            products = productService.getProductsByPage(page, PRODUCTS_PER_PAGE);
            totalProducts = productService.getTotalProducts();
        }

        int totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);

        request.setAttribute("products", products);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("paginationUrl", buildPaginationUrl(category));

        request.getRequestDispatcher("/views/home.jsp").forward(request, response);
    }

    private String buildPaginationUrl(String category) {
        try {
            if (category != null && !category.isEmpty()) {
                return "home?category=" + URLEncoder.encode(category, StandardCharsets.UTF_8.toString()) + "&page=";
            }
        } catch (Exception e) {
            // Fallback to unencoded if there's an encoding error
            return "home?category=" + category + "&page=";
        }
        return "home?page=";
    }

    private int getPageNumber(HttpServletRequest request) {
        try {
            return Math.max(1, Integer.parseInt(request.getParameter("page")));
        } catch (NumberFormatException e) {
            return 1;
        }
    }
}