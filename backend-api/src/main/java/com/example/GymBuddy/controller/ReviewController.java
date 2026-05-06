package com.example.GymBuddy.controller;

import com.example.GymBuddy.model.Review;
import com.example.GymBuddy.service.ReviewService;
import com.ReplyRequest;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/reviews")
@CrossOrigin("*")
public class ReviewController {

    private final ReviewService service;

    public ReviewController(ReviewService service) {
        this.service = service;
    }

    // ✅ Create review
    @PostMapping
    public Review createReview(
            @RequestParam Long userId,
            @RequestParam Long gymId,
            @RequestBody Review review
    ) {
        return service.createReview(userId, gymId, review);
    }

    // ✅ Get reviews by gym
    @GetMapping("/gym/{gymId}")
    public List<Review> getByGym(@PathVariable Long gymId) {
        return service.getReviewsByGym(gymId);
    }

    // ✅ Get reviews by user
    @GetMapping("/user/{userId}")
    public List<Review> getByUser(@PathVariable Long userId) {
        return service.getReviewsByUser(userId);
    }

    // ✅ Owner reply to a review
    @PatchMapping("/{id}/reply")
    public Review replyToReview(@PathVariable Long id, @RequestBody ReplyRequest request) {
        return service.replyToReview(id, request.getReply());
    }
}