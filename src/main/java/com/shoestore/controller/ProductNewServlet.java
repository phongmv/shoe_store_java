package com.shoestore.controller;

import com.shoestore.service.ProductService;
import com.shoestore.model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/product-new")
public class ProductNewServlet extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/product-new.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy các tham số từ form và kiểm tra null, loại bỏ khoảng trắng thừa
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String category = request.getParameter("category");

        // Kiểm tra nếu các giá trị quan trọng bị null hoặc rỗng
        if (name == null || name.trim().isEmpty()) {
            response.getWriter().write("Product name is required");
            return; // Dừng xử lý nếu không có tên sản phẩm
        }

        if (description == null || description.trim().isEmpty()) {
            response.getWriter().write("Product description is required");
            return;
        }

        if (category == null || category.trim().isEmpty()) {
            response.getWriter().write("Product category is required");
            return;
        }

        // Lấy và chuyển đổi giá trị price và stock, kiểm tra giá trị hợp lệ
        double price;
        try {
            price = Double.parseDouble(request.getParameter("price"));
        } catch (NumberFormatException e) {
            response.getWriter().write("Invalid price");
            return; // Dừng xử lý nếu giá không hợp lệ
        }

        int stock = 0; // Assuming stock is not part of the form in your JSP (this can be added as necessary)
        // Kiểm tra nếu stock cần được lấy từ form hoặc có giá trị mặc định

        // Lấy phần hình ảnh
        Part imagePart = request.getPart("image");
        byte[] imageBytes = null;

        if (imagePart != null) {
            try (InputStream imageInputStream = imagePart.getInputStream()) {
                imageBytes = imageInputStream.readAllBytes(); // Đọc tất cả byte từ InputStream
            } catch (IOException e) {
                e.printStackTrace();
                response.getWriter().write("Failed to read image");
                return;
            }
        }

        // Tạo đối tượng Product
        Product product = new Product();
        product.setName(name.trim()); // Đảm bảo loại bỏ khoảng trắng thừa
        product.setDescription(description.trim());
        product.setPrice(price);
        product.setStock(stock); // Nếu có thêm trường stock trong form thì sửa
        product.setCategory(category.trim());
        product.setImage(imageBytes); // Lưu ảnh dưới dạng byte[]

        // Thêm sản phẩm vào cơ sở dữ liệu
        boolean isAdded = productService.addProduct(product);

        // Xử lý kết quả
        if (isAdded) {
            response.sendRedirect(request.getContextPath() + "/products");
        } else {
            response.getWriter().write("Failed to add product");
        }
    }
}
