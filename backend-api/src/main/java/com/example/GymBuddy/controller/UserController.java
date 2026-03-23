package com.example.GymBuddy.controller;

import com.example.GymBuddy.model.User;
import com.example.GymBuddy.service.UserService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/users")
@CrossOrigin("*")
public class UserController {

    private final UserService service;

    public UserController(UserService service) {
        this.service = service;
    }

    @PostMapping("/register")
    public User register(@RequestBody User user) {
        return service.register(user);
    }

    @GetMapping
    public List<User> getAllUsers() {
        return service.getAllUsers();
    }
}