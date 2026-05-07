package com.example.GymBuddy.controller;
import java.util.List;
import com.example.GymBuddy.model.Gym;
import com.example.GymBuddy.model.Review;
import com.example.GymBuddy.model.User;
import com.example.GymBuddy.repository.GymRepository;
import com.example.GymBuddy.service.GymService;
import com.example.GymBuddy.service.ReviewService;
import com.example.GymBuddy.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
public class UIController {

    private final GymRepository gymRepository;
    private final GymService gymService;
    private final ReviewService reviewService;
    private final UserService userService;

    public UIController(GymRepository gymRepository, GymService gymService,
                        ReviewService reviewService, UserService userService) {
        this.gymRepository = gymRepository;
        this.gymService = gymService;
        this.reviewService = reviewService;
        this.userService = userService;
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

    @PostMapping("/owner/login")
    public String ownerLogin(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        User owner = userService.getAllUsers().stream()
            .filter(u -> u.getEmail() != null &&
                         u.getEmail().trim().equalsIgnoreCase(email.trim()) &&
                         u.getPassword() != null &&
                         u.getPassword().trim().equals(password.trim()))
            .findFirst().orElse(null);

        if (owner != null) {
            session.setAttribute("ownerId", owner.getId());
            return "redirect:/gym/dashboard";
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "gym-signin";
        }
    }

    @GetMapping("/gym/auth")
    public String gymAuth() {
        return "gym-signup";
    }

    @PostMapping("/gym/signup")
    public String gymSignup(
            @RequestParam String email,
            @RequestParam String password) {
        User owner = new User();
        owner.setName(email);
        owner.setEmail(email);
        owner.setPassword(password);
        userService.register(owner);
        return "redirect:/gym/signin";
    }

    @GetMapping("/gym/dashboard")
    public String gymDashboard(HttpSession session, Model model) {
        Long ownerId = (Long) session.getAttribute("ownerId");
        if (ownerId == null) return "redirect:/gym/signin";
        model.addAttribute("gyms", gymService.getGymsByOwner(ownerId));
        return "gym-dashboard";
    }

    @GetMapping("/gym/profile")
    public String gymProfile(HttpSession session, Model model) {
        Long ownerId = (Long) session.getAttribute("ownerId");
        if (ownerId == null) return "redirect:/gym/signin";
        model.addAttribute("owner", gymService.getAllGyms().stream()
            .filter(g -> ownerId.equals(g.getOwnerId()))
            .findFirst().orElse(null));
        return "gym-profile";
    }

    @GetMapping("/gym/reviews")
    public String gymReviews(HttpSession session, Model model) {
    Long ownerId = (Long) session.getAttribute("ownerId");
    if (ownerId == null) return "redirect:/gym/signin";
    
    List<Review> reviews = gymService.getGymsByOwner(ownerId).stream()
        .flatMap(gym -> reviewService.getReviewsByGym(gym.getId()).stream())
        .collect(java.util.stream.Collectors.toList());
    
    model.addAttribute("reviews", reviews);
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
    public String showCreateGymForm(HttpSession session, Model model) {
        Long ownerId = (Long) session.getAttribute("ownerId");
        if (ownerId == null) return "redirect:/gym/signin";
        model.addAttribute("gym", new Gym());
        return "gym-setup";
    }

    @PostMapping("/gyms")
    public String createGym(@ModelAttribute Gym gym, HttpSession session) {
    Long ownerId = (Long) session.getAttribute("ownerId");
    if (ownerId != null) gym.setOwnerId(ownerId);
    gymService.saveGym(gym);
    return "redirect:/gym/dashboard";
    }
    
    @PostMapping("/owner/setup")
    public String saveOwnerAndGym(
            @RequestParam String ownerName,
            @RequestParam String email,
            @RequestParam String password,
            @ModelAttribute Gym gym,
            HttpSession session) {
        User owner = new User();
        owner.setName(ownerName);
        owner.setEmail(email);
        owner.setPassword(password);
        User saved = userService.register(owner);
        gym.setOwnerId(saved.getId());
        session.setAttribute("ownerId", saved.getId());
        gymService.saveGym(gym);
        return "redirect:/gym/dashboard";
    }

    @GetMapping("/owner/gym/{id}")
    public String manageGym(@PathVariable Long id, HttpSession session, Model model) {
        Long ownerId = (Long) session.getAttribute("ownerId");
        if (ownerId == null) return "redirect:/gym/signin";
        Optional<Gym> optionalGym = gymService.getGymById(id);
        if (optionalGym.isPresent() && ownerId.equals(optionalGym.get().getOwnerId())) {
            model.addAttribute("gym", optionalGym.get());
            return "gym-setup";
        }
        return "redirect:/gym/dashboard";
    }

    @GetMapping("/gyms/delete/{id}")
    public String deleteGym(@PathVariable Long id, HttpSession session) {
        Long ownerId = (Long) session.getAttribute("ownerId");
        if (ownerId == null) return "redirect:/gym/signin";
        Optional<Gym> optionalGym = gymService.getGymById(id);
        if (optionalGym.isPresent() && ownerId.equals(optionalGym.get().getOwnerId())) {
            gymService.deleteGym(id);
        }
        return "redirect:/gym/dashboard";
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

    @PostMapping("/owner/gym/update")
    public String updateGym(@ModelAttribute Gym gym, HttpSession session) {
    Long ownerId = (Long) session.getAttribute("ownerId");
    if (ownerId == null) return "redirect:/gym/signin";
    Optional<Gym> existing = gymService.getGymById(gym.getId());
    if (existing.isPresent() && ownerId.equals(existing.get().getOwnerId())) {
        gym.setOwnerId(ownerId);
        gymService.saveGym(gym);
        }
    return "redirect:/gym/dashboard";
    }
    @PostMapping("/owner/review/{id}/reply")
    public String replyToReview(@PathVariable Long id,
                             @RequestParam String reply,
                             HttpSession session) {
    Long ownerId = (Long) session.getAttribute("ownerId");
    if (ownerId == null) return "redirect:/gym/signin";
    reviewService.replyToReview(id, reply);
    return "redirect:/gym/reviews";
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