package com.nt.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;

import com.nt.model.Address;
import com.nt.model.User;
import com.nt.service.AddressServiceINF;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.validation.BindingResult;

@Controller
public class AddressController {

    @Autowired
    private AddressServiceINF service;

    // -------- OPEN ADDRESS PAGE --------
    @GetMapping("/order")
    public String order(Model model, HttpSession session) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            model.addAttribute("errorMsg", "Please login first");
            return "login";
        }

        model.addAttribute("address", new Address());
        return "address";
    }

    // -------- PLACE OR UPDATE ORDER --------
    @PostMapping("/order")
    public String placeOrder(@Valid @ModelAttribute("address") Address address,
                             BindingResult result,
                             HttpSession session,
                             Model model) {

        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        // Validate blank/whitespace inputs
        if (result.hasErrors()) {
            return "address";  // return form with error messages
        }

        try {
            service.saveOrUpdateAddress(address, user);

            model.addAttribute("msg", "Order delivered in 10 minutes");
            model.addAttribute("address", address);

            return "order-success";

        } catch (Exception e) {
            model.addAttribute("errorMsg", "Something went wrong. Please try again.");
            return "address";
        }
    }
}