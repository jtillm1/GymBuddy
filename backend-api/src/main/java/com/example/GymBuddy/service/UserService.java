package com.example.GymBuddy.service;

import com.example.GymBuddy.model.User;
import com.example.GymBuddy.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User register(User user) {
        return userRepository.save(user);
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User updateUser(Long id, User updatedUser) {
        User existing = userRepository.findById(id).orElseThrow();

        existing.setName(updatedUser.getName());
        existing.setEmail(updatedUser.getEmail());
        existing.setLocation(updatedUser.getLocation());
        existing.setWorkoutStyle(updatedUser.getWorkoutStyle());
        existing.setMaxBudget(updatedUser.getMaxBudget());

        return userRepository.save(existing);
    }
}
