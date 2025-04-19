package com.shoestore.controller;

import com.shoestore.dao.ProductDAO;
import com.shoestore.model.Product;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/product-detail")
public class ProductDetailServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        productDAO = new ProductDAO(); // Initialize your DAO
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("id"));
            Product product = productDAO.getProductById(productId);

            if (product != null) {
                request.setAttribute("product", product);
                request.getRequestDispatcher("/views/product-detail.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/home?error=Product+not+found");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/home?error=Invalid+product+ID");
        }
    }
}