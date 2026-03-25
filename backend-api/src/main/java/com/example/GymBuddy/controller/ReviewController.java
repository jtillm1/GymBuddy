package com.example.GymBuddy.controller;

import com.example.GymBuddy.model.Review;
import com.example.GymBuddy.service.ReviewService;
import org.springframework.web.bind.annotation.*;
import com.ReplyRequest;


import java.util.List;

@RestController
@RequestMapping("/api/reviews")
@CrossOrigin("*")
public class ReviewController {

    private final ReviewService service;

    public ReviewController(ReviewService service) {
        this.service = service;
    }

    @PostMapping
    public Review createReview(
            @RequestParam Long userId,
            @RequestParam Long gymId,
            @RequestBody Review review
    ) {
        return service.createReview(userId, gymId, review);
    }

    @GetMapping
    public List<Review> getAllReviews() {
        return service.getAllReviews();
    }

    @GetMapping("/gym/{gymId}")
    public List<Review> getByGym(@PathVariable Long gymId) {
        return service.getReviewsByGym(gymId);
    }

    @GetMapping("/user/{userId}")
    public List<Review> getByUser(@PathVariable Long userId) {
        return service.getReviewsByUser(userId);
    }

    @PutMapping("/{reviewId}/reply")
public Review replyToReview(
        @PathVariable Long reviewId,
        @RequestBody ReplyRequest request
) {
    return service.replyToReview(reviewId, request.getReply());
}

}