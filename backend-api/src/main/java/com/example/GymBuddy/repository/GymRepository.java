package com.example.GymBuddy.repository;

import com.example.GymBuddy.model.Gym;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface GymRepository extends JpaRepository<Gym, Long> {
    List<Gym> findByOwnerId(Long ownerId);
}
