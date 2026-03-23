package com.example.GymBuddy.repository;

import com.example.GymBuddy.model.Gym;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GymRepository extends JpaRepository<Gym, Long> {
}