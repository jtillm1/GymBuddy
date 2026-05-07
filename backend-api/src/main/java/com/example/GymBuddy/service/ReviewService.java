package com.example.GymBuddy.service;

import com.example.GymBuddy.model.Review;
import com.example.GymBuddy.model.User;
import com.example.GymBuddy.model.Gym;
import com.example.GymBuddy.repository.ReviewRepository;
import com.example.GymBuddy.repository.UserRepository;
import com.example.GymBuddy.repository.GymRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {

    private final ReviewRepository reviewRepository;
    private final UserRepository userRepository;
    private final GymRepository gymRepository;

    public ReviewService(ReviewRepository reviewRepository,
                         UserRepository userRepository,
                         GymRepository gymRepository) {
        this.reviewRepository = reviewRepository;
        this.userRepository = userRepository;
        this.gymRepository = gymRepository;
    }

    // ✅ CREATE REVIEW (FIXED)
    public Review createReview(Long userId, Long gymId, Review review) {

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        Gym gym = gymRepository.findById(gymId)
                .orElseThrow(() -> new RuntimeException("Gym not found"));

        review.setUser(user);
        review.setGym(gym);

        return reviewRepository.save(review);
    }

    // ✅ GET REVIEWS BY GYM
    public List<Review> getReviewsByGym(Long gymId) {
        return reviewRepository.findByGymId(gymId);
    }

    // ✅ GET REVIEWS BY USER (THIS FIXES YOUR ERROR)
    public List<Review> getReviewsByUser(Long userId) {
        return reviewRepository.findByUserId(userId);
    }

    // ✅ OWNER REPLY TO A REVIEW
    public Review replyToReview(Long reviewId, String reply) {
        Review review = reviewRepository.findById(reviewId)
                .orElseThrow(() -> new RuntimeException("Review not found"));
        review.setReply(reply);
        review.setReplyDate(java.time.LocalDate.now().toString());
        return reviewRepository.save(review);
    }
    public List<Review> getAllReviews() {
    return reviewRepository.findAll();
    }
}