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

    // getters and setters
}