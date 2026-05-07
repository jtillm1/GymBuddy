package com.example.GymBuddy.service;

import com.example.GymBuddy.repository.ReviewRepository;
import com.example.GymBuddy.model.Gym;
import com.example.GymBuddy.repository.GymRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class GymService {

    private final GymRepository gymRepository;
    private final ReviewRepository reviewRepository;

    public GymService(GymRepository gymRepository, ReviewRepository reviewRepository) {
    this.gymRepository = gymRepository;
    this.reviewRepository = reviewRepository;
    }

    
    // Get all gyms
    public List<Gym> getAllGyms() {
        return gymRepository.findAll();
    }

    // Get gym by ID
    public Optional<Gym> getGymById(Long id) {
        return gymRepository.findById(id);
    }

    // Create new gym
    public Gym createGym(Gym gym) {
        return gymRepository.save(gym);
    }

    // Update gym
    public Gym updateGym(Long id, Gym updatedGym) {
        return gymRepository.findById(id).map(gym -> {
            gym.setName(updatedGym.getName());
            gym.setLocation(updatedGym.getLocation());
            gym.setPrice(updatedGym.getPrice());
            gym.setDescription(updatedGym.getDescription());
            return gymRepository.save(gym);
        }).orElseThrow(() -> new RuntimeException("Gym not found with id " + id));
    }

    // Delete gym
    public void deleteGym(Long id) {
        reviewRepository.deleteByGymId(id);
        gymRepository.deleteById(id);
    }

    // Save gym (alias for create, used by owner forms)
    public Gym saveGym(Gym gym) {
    if (gym.getId() != null && gym.getId() > 0) {
        Gym existing = gymRepository.findById(gym.getId())
            .orElseThrow(() -> new RuntimeException("Gym not found"));
        existing.setName(gym.getName());
        existing.setLocation(gym.getLocation());
        existing.setPrice(gym.getPrice());
        existing.setDescription(gym.getDescription());
        existing.setWebsite(gym.getWebsite());
        existing.setOwnerId(gym.getOwnerId());
        return gymRepository.save(existing);
    }
    // New gym - make sure ID is null so Hibernate generates one
    gym.setId(null);
    return gymRepository.save(gym);
    }
    
    public List<Gym> getGymsByOwner(Long ownerId) {
    return gymRepository.findByOwnerId(ownerId);
    }
}