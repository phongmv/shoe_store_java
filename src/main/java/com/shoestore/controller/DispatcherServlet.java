package com.shoestore.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DispatcherServlet", value = "/DispatcherServlet")
public class DispatcherServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        switch (path) {
            case "/login":
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                break;
            case "/register":
                request.getRequestDispatcher("/views/register.jsp").forward(request, response);
                break;
            case "/product":
                request.getRequestDispatcher("/views/product-detail.jsp").forward(request, response);
                break;
            case "/cart":
                request.getRequestDispatcher("/views/cart.jsp").forward(request, response);
                break;
            case "/about":
                request.getRequestDispatcher("/views/about.jsp").forward(request, response);
                break;
            case "/contact":
                request.getRequestDispatcher("/views/contact.jsp").forward(request, response);
                break;
            case "/shipping":
                request.getRequestDispatcher("/views/shipping.jsp").forward(request, response);
                break;
            case "/returns":
                request.getRequestDispatcher("/views/returns.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("/views/home.jsp").forward(request, response);
                break;
        }
    }
}