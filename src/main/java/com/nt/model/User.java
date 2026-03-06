package com.nt.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Username is required")
    @Column(unique = true, nullable = false)
    private String username;

    @NotBlank(message = "Password is required")
    private String password;

    @Email(message = "Invalid email format")
    private String email;

    @Pattern(regexp = "^[0-9]{10}$", message = "Phone must be 10 digits")
    private String phone;   //  Added missing field

    // No-arg constructor
    public User() {}

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { 
        this.username = username != null ? username.trim() : null; 
    }

    public String getPassword() { return password; }
    public void setPassword(String password) { 
        this.password = password != null ? password.trim() : null; 
    }

    public String getEmail() { return email; }
    public void setEmail(String email) { 
        this.email = email != null ? email.trim() : null; 
    }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { 
        this.phone = phone != null ? phone.trim() : null; 
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }

}
