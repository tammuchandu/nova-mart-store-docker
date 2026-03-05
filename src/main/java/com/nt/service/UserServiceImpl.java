package com.nt.service;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.nt.model.User;
import com.nt.repo.UserRepoINF;

@Service
public class UserServiceImpl implements UserServiceINF {

    @Autowired
    private UserRepoINF repo;

    // ================= REGISTER =================
    @Override
    public User registerUser(User user) {

        String username = user.getUsername().trim();

        // Check existing username (ignore case)
        User existingUser = repo.findByUsernameIgnoreCase(username);

        if (existingUser != null) {

            // UPDATE existing user
            existingUser.setPassword(user.getPassword());
            existingUser.setEmail(user.getEmail());
            existingUser.setPhone(user.getPhone());

            return repo.save(existingUser);
        }

        //  SAVE new user
        user.setUsername(username);
        return repo.save(user);
    }

    // ================= LOGIN =================
    @Override
    public User loginUser(String username, String password) {

        User user = repo.findByUsernameIgnoreCase(username.trim());

        if (user != null && user.getPassword().equals(password.trim())) {
            return user;
        }

        return null;
    }
}