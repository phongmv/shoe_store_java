package com.shoestore.controller;

import com.shoestore.model.Product;
import com.shoestore.service.ProductService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/products/*")
public class ProductController extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();

        if (action == null || action.equals("/")) {
            List<Product> products = productService.getAllProducts();
            request.setAttribute("products", products);
            request.getRequestDispatcher("/views/home.jsp").forward(request, response);
        } else if (action.equals("/detail")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Product product = productService.getProductById(id);
            request.setAttribute("product", product);
            request.getRequestDispatcher("/views/product-detail.jsp").forward(request, response);
        }
    }
}