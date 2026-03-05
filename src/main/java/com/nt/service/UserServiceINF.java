package com.nt.service;

import com.nt.model.User;

public interface UserServiceINF {
    User registerUser(User user);
    User loginUser(String username, String password);
}