package com.shoestore.service;

import com.shoestore.dao.UserDAO;
import com.shoestore.model.User;

public class UserService {
    private final UserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAO();
    }

    public boolean register(User user) {
        return userDAO.registerUser(user);
    }

    public User login(String username, String password) {
        return userDAO.login(username, password);
    }
}