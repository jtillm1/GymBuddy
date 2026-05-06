package com.example.GymBuddy.model;

import jakarta.persistence.*;

@Entity
public class Gym {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String location;
    private double price;
    private String description;

    // 🆕 NEW FIELD
    private boolean beginnerFriendly;

    public Gym() {}

    public Gym(String name, String location, double price, String description, boolean beginnerFriendly) {
        this.name = name;
        this.location = location;
        this.price = price;
        this.description = description;
        this.beginnerFriendly = beginnerFriendly;
    }

    public Long getId() { return id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    // 🆕 Getter/Setter
    public boolean isBeginnerFriendly() { return beginnerFriendly; }
    public void setBeginnerFriendly(boolean beginnerFriendly) { this.beginnerFriendly = beginnerFriendly; }
}