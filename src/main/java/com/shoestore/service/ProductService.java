package com.shoestore.service;

import com.shoestore.dao.ProductDAO;
import com.shoestore.model.Product;
import java.util.List;

public class ProductService {
    private final ProductDAO productDAO;

    public ProductService() {
        this.productDAO = new ProductDAO();
    }

    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }

    public Product getProductById(int id) {
        return productDAO.getProductById(id);
    }

    public List<Product> getProductsByPage(int page, int productsPerPage) {
        return productDAO.getProductsByPage(page, productsPerPage);
    }

    public int getTotalProducts() {
        return productDAO.getTotalProducts();
    }
}