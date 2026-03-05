package com.nt.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name = "address")
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "House/Flat cannot be empty")
    private String house;

    @NotBlank(message = "City cannot be empty")
    private String city;

    @NotBlank(message = "Pincode cannot be empty")
    private String pincode;

    @Column(nullable = false)
    private String username;

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getHouse() { return house; }
    public void setHouse(String house) { this.house = house; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getPincode() { return pincode; }
    public void setPincode(String pincode) { this.pincode = pincode; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
}