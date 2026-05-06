package com.example.GymBuddy.controller;

import com.example.GymBuddy.model.Gym;
import com.example.GymBuddy.repository.GymRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/gyms")
@CrossOrigin("*")
public class GymController {

    private final GymRepository repo;

    public GymController(GymRepository repo) {
        this.repo = repo;
    }

    // ✅ Get all gyms
    @GetMapping
    public List<Gym> getAllGyms() {
        return repo.findAll();
    }

    // ✅ Get gym by ID
    @GetMapping("/{id}")
    public Gym getGym(@PathVariable Long id) {
        return repo.findById(id).orElseThrow();
    }
}