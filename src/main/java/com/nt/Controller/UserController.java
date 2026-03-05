package com.nt.Controller;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.nt.model.User;

import com.nt.service.UserServiceINF;

@Controller
public class UserController {

    @Autowired
    private UserServiceINF userService;

    // ---------- HOME ----------
    @GetMapping("/")
    public String home() {
        return "home";
    }

    // ---------- REGISTER PAGE ----------
    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    // ---------- REGISTER PROCESS ----------
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("user") User user,
                           BindingResult result,
                           Model model) {

        if (result.hasErrors()) {
            return "register";
        }

        try {
            userService.registerUser(user);
            model.addAttribute("msg", "Registration Successful! Please login.");
            return "login";

        } catch (Exception e) {
            model.addAttribute("errorMsg", "Registration failed: " + e.getMessage());
            return "register";
        }
    }


  //  ---------- LOGIN PAGE ----------
    @GetMapping("/login")
    public String loginPage(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }
    //---------- LOGIN PROCESS ----------
    @PostMapping("/login")
    public String login(@ModelAttribute("user") User user,
                        HttpSession session,
                        Model model) {
    	/*The database is checked

    	->If username + password match a record → User object returned

    	->If NO match → null returned*/
    	 /*NOT:-If the data entered by the user does not match the data stored in the database, then loginUser() returns null.*/
        try {
            User dbUser = userService.loginUser(
                    user.getUsername().trim(),
                    user.getPassword().trim()
            );
            /*NOT:-“Store the logged-in user’s database record in the session, so we know who is logged in for future requests.”*/
            if (dbUser == null) {
                model.addAttribute("errorMsg", "Invalid username or password");
                return "login";
            }

            session.setAttribute("user", dbUser);
            return "redirect:/products";

        } catch (Exception e) {
            model.addAttribute("errorMsg", "Something went wrong. Please try again.");
            return "login";
        }
    }

    // ---------- LOGOUT ----------
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}