package com.example.GymBuddy.controller;

import com.example.GymBuddy.model.Gym;
import com.example.GymBuddy.model.User;
import com.example.GymBuddy.service.GymService;
import com.example.GymBuddy.service.ReviewService;
import com.example.GymBuddy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ViewController {

    @Autowired
    private GymService gymService;

    @Autowired
    private UserService userService;

    @Autowired
    private ReviewService reviewService;

    /* ══════════════════════════════
       HOME
    ══════════════════════════════ */

    @GetMapping("/")
    public String home() {
        return "redirect:/gyms";
    }

    /* ══════════════════════════════
       GYM LIST + CRUD
    ══════════════════════════════ */

    @GetMapping("/gyms")
    public String getGyms(Model model) {
        model.addAttribute("gyms", gymService.getAllGyms());
        return "gyms";
    }

    @GetMapping("/gyms/new")
    public String showCreateGymForm(Model model) {
        model.addAttribute("gym", new Gym());
        return "create-gym";
    }

    @PostMapping("/gyms")
    public String createGym(@ModelAttribute Gym gym) {
        gymService.saveGym(gym);
        return "redirect:/gyms";
    }

    @GetMapping("/gyms/delete/{id}")
    public String deleteGym(@PathVariable Long id) {
        gymService.deleteGym(id);
        return "redirect:/gyms";
    }

    /* ══════════════════════════════
       GYM OWNER PAGES
    ══════════════════════════════ */

    @GetMapping("/gym/signin")
    public String gymSignin() {
        return "gym-signin";
    }

    @GetMapping("/gym/signup")
    public String gymSignup() {
        return "gym-signup";
    }

    @PostMapping("/gym/signup")
    public String handleSignup(@ModelAttribute User user) {
        userService.register(user);
        return "redirect:/gym/setup";
    }

    @GetMapping("/gym/dashboard")
    public String gymDashboard(Model model) {
        model.addAttribute("gyms", gymService.getAllGyms());
        return "gym-dashboard";
    }

    @GetMapping("/gym/profile")
    public String gymProfile(Model model) {
        // TODO: replace 1L with logged-in user's ID once auth is set up
        model.addAttribute("owner", userService.getUserById(1L));
        return "gym-profile";
    }

    @GetMapping("/gym/reviews")
    public String gymReviews(Model model) {
        model.addAttribute("reviews", reviewService.getAllReviews());
        return "gym-reviews";
    }

    @GetMapping("/gym/setup")
    public String gymSetup() {
        return "gym-setup";
    }
}