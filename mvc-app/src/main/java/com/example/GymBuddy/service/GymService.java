package com.example.GymBuddy.service;

import com.example.GymBuddy.model.Gym;
import com.example.GymBuddy.repository.GymRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class GymService {

    private final GymRepository gymRepository;

    public GymService(GymRepository gymRepository) {
        this.gymRepository = gymRepository;
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
        gymRepository.deleteById(id);
    }

    public void saveGym(Gym gym) {
        
  gymRepository.save(gym);
}    }
