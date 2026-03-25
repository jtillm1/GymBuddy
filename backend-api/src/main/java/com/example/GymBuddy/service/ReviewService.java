package com.example.GymBuddy.service;

import com.example.GymBuddy.model.*;
import com.example.GymBuddy.repository.*;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class ReviewService {

    private final ReviewRepository reviewRepo;
    private final UserRepository userRepo;
    private final GymRepository gymRepo;

    public ReviewService(ReviewRepository reviewRepo, UserRepository userRepo, GymRepository gymRepo) {
        this.reviewRepo = reviewRepo;
        this.userRepo = userRepo;
        this.gymRepo = gymRepo;
    }

    public Review createReview(Long userId, Long gymId, Review review) {
        User user = userRepo.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        Gym gym = gymRepo.findById(gymId)
                .orElseThrow(() -> new RuntimeException("Gym not found"));

        review.setUser(user);
        review.setGym(gym);

        return reviewRepo.save(review);
    }

    public List<Review> getAllReviews() {
        return reviewRepo.findAll();
    }

    public List<Review> getReviewsByGym(Long gymId) {
        return reviewRepo.findByGymId(gymId);
    }

    public List<Review> getReviewsByUser(Long userId) {
        return reviewRepo.findByUserId(userId);
    }

    public Review replyToReview(Long reviewId, String replyText) {
        Review review = reviewRepo.findById(reviewId)
                .orElseThrow(() -> new RuntimeException("Review not found"));

        review.setReply(replyText);
        review.setReplyDate(LocalDate.now().toString());

        return reviewRepo.save(review);
    }
}