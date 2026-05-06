package com.example.GymBuddy.repository;

import com.example.GymBuddy.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, Long> {

    List<Review> findByGymId(Long gymId);

    List<Review> findByUserId(Long userId);
}