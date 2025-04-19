package com.shoestore.service;

import com.shoestore.dao.ProductDAO;
import com.shoestore.model.Product;
import java.util.List;

public class ProductService {
    private ProductDAO productDAO;

    public ProductService() {
        this.productDAO = new ProductDAO();
    }

    // Thêm các phương thức mới
    public List<Product> getProductsByCategoryAndPage(String category, int page, int productsPerPage) {
        return productDAO.getProductsByCategoryAndPage(category, page, productsPerPage);
    }

    public int getTotalProductsByCategory(String category) {
        return productDAO.getTotalProductsByCategory(category);
    }

    // Giữ nguyên các phương thức hiện có
    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }

    public Product getProductById(int id) {
        return productDAO.getProductById(id);
    }

    public int getTotalProducts() {
        return productDAO.getTotalProducts();
    }

    public List<Product> getProductsByPage(int page, int productsPerPage) {
        return productDAO.getProductsByPage(page, productsPerPage);
    }
}