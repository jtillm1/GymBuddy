package com.example.GymBuddy.controller;

import com.example.GymBuddy.repository.GymRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.example.GymBuddy.model.Gym;
import com.example.GymBuddy.service.GymService;
import java.util.Optional;


@Controller
public class UIController {

    private final GymRepository gymRepository;
    private final GymService gymService;

    public UIController(GymRepository gymRepository, GymService gymService) {
        this.gymRepository = gymRepository;
        this.gymService = gymService;
    }

    /* ══════════════════════════════
       CUSTOMER PAGES
    ══════════════════════════════ */

    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/gyms")
    public String gyms(Model model) {
        try {
            model.addAttribute("gyms", gymRepository.findAll());
            return "customer-landing";
        } catch (Exception e) {
            model.addAttribute("error", e.getClass().getName() + ": " + e.getMessage());
            if (e.getCause() != null) {
                model.addAttribute("cause", e.getCause().getMessage());
            }
            return "error-debug";
        }
    }

    @GetMapping("/reviews")
    public String reviews(@RequestParam(required = false) Long gymId,
                          @RequestParam(required = false) String gym,
                          Model model) {
        model.addAttribute("gymId", gymId);
        model.addAttribute("gymName", gym != null ? gym : "Unknown Gym");
        return "customer-review";
    }

    @GetMapping("/signin")
    public String signin() {
        return "customer-signin";
    }

    @GetMapping("/signup")
    public String signup() {
        return "customer-auth";
    }

    /* ══════════════════════════════
       GYM OWNER PAGES
    ══════════════════════════════ */

    @GetMapping("/gym/signin")
    public String gymSignin() {
        return "gym-signin";
    }

    @GetMapping("/gym/auth")
    public String gymAuth() {
        return "gym-setup";
    }

    @GetMapping("/gym/dashboard")
    public String gymDashboard(Model model) {
        model.addAttribute("gyms", gymService.getAllGyms());
        return "gym-dashboard";
    }

    @GetMapping("/gym/profile")
    public String gymProfile(Model model) {
        model.addAttribute("owner", new Object());
        return "gym-profile";
    }

    @GetMapping("/gym/reviews")
    public String gymReviews(Model model) {
        model.addAttribute("reviews", new Object());
        return "gym-reviews";
    }

    @GetMapping("/gym/setup")
    public String gymSetup() {
        return "gym-setup";
    }

    /* ══════════════════════════════
       GYM CRUD (OWNER ACTIONS)
    ══════════════════════════════ */

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

    @GetMapping("/gyms/{id}")
    public String getGymById(@PathVariable Long id, Model model) {
        Optional<Gym> optionalGym = gymService.getGymById(id);
        if (optionalGym.isPresent()) {
            model.addAttribute("gym", optionalGym.get());
            return "gym-dashboard";
        }
        return "redirect:/gyms";
    }

    @GetMapping("/gyms/delete/{id}")
    public String deleteGym(@PathVariable Long id) {
        gymService.deleteGym(id);
        return "redirect:/gyms";
    }

    /* ══════════════════════════════
       DEBUG
    ══════════════════════════════ */

    @GetMapping("/test")
    @ResponseBody
    public String test() {
        return "WORKS";
    }
}
