package com.example.GymBuddy.model;

import jakarta.persistence.*;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String email;
    private String password;
    private String role;

    private String location;
    private String workoutStyle;
    private double maxBudget;

    // getters and setters
}