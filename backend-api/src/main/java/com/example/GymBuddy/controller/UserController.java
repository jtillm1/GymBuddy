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

    // ✅ REGISTER
    @PostMapping("/register")
    public User register(@RequestBody User user) {
        user.setRole("CUSTOMER");
        return service.register(user);
    }

    // ✅ GET ALL USERS (THIS FIXES YOUR ERROR)
    @GetMapping
    public List<User> getAllUsers() {
        return service.getAllUsers();
    }

    // ✅ UPDATE USER
    @PutMapping("/{id}")
    public User updateUser(@PathVariable Long id, @RequestBody User updatedUser) {
        return service.updateUser(id, updatedUser);
    }

    // ✅ LOGIN
    @PostMapping("/login")
    public org.springframework.http.ResponseEntity<?> login(@RequestBody User loginRequest) {
        String incomingEmail = loginRequest.getEmail() != null ? loginRequest.getEmail().trim().toLowerCase() : "";
        String incomingPassword = loginRequest.getPassword() != null ? loginRequest.getPassword().trim() : "";

        return service.getAllUsers().stream()
            .filter(u -> {
                String dbEmail = u.getEmail() != null ? u.getEmail().trim().toLowerCase() : "";
                String dbPassword = u.getPassword() != null ? u.getPassword().trim() : "";
                return dbEmail.equals(incomingEmail) && dbPassword.equals(incomingPassword);
            })
            .findFirst()
            .<org.springframework.http.ResponseEntity<?>>map(u -> org.springframework.http.ResponseEntity.ok(u))
            .orElse(org.springframework.http.ResponseEntity.status(401).body("Invalid email or password"));
    }
}