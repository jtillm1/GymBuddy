package com.example.GymBuddy.repository;

import com.example.GymBuddy.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReviewRepository extends JpaRepository<Review, Long> {
}