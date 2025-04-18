package com.shoestore.controller;

import com.shoestore.model.CartItem;
import com.shoestore.model.Product;
import com.shoestore.service.ProductService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartController", value = "/cart/*")
public class CartController extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        request.getRequestDispatcher("views/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();

        if (action == null) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        switch (action) {
            case "/add":
                addToCart(request, response);
                break;
            case "/update":
                updateCart(request, response);
                break;
            case "/remove":
                removeFromCart(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/cart");
        }
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            Product product = productService.getProductById(productId);
            if (product != null) {
                HttpSession session = request.getSession();
                List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

                if (cart == null) {
                    cart = new ArrayList<>();
                    session.setAttribute("cart", cart);
                }

                // Use stream API to find existing item
                List<CartItem> finalCart = cart;
                cart.stream()
                        .filter(item -> item.getProduct().getId() == productId)
                        .findFirst()
                        .ifPresentOrElse(
                                item -> item.setQuantity(item.getQuantity() + quantity),
                                () -> finalCart.add(new CartItem(product, quantity))
                        );
            }
        } catch (NumberFormatException e) {
            // Handle invalid number format
        }
        response.sendRedirect(request.getContextPath() + "/cart");
    }

    private void updateCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            HttpSession session = request.getSession();
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

            if (cart != null) {
                cart.stream()
                        .filter(item -> item.getProduct().getId() == productId)
                        .findFirst()
                        .ifPresent(item -> {
                            if (quantity > 0) {
                                item.setQuantity(quantity);
                            } else {
                                cart.remove(item);
                            }
                        });
            }
        } catch (NumberFormatException e) {
            // Handle invalid number format
        }
        response.sendRedirect(request.getContextPath() + "/cart");
    }

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));

            HttpSession session = request.getSession();
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

            if (cart != null) {
                cart.removeIf(item -> item.getProduct().getId() == productId);
            }
        } catch (NumberFormatException e) {
            // Handle invalid number format
        }
        response.sendRedirect(request.getContextPath() + "/cart");
    }
}