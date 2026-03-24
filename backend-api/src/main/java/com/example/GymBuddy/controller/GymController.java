package main.java.com.example.GymBuddy.controller;

import com.example.GymBuddy.model.Gym;
import com.example.GymBuddy.service.GymService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/gyms")
@CrossOrigin(origins = "*") // allows frontend connection
public class GymController {

    private final GymService gymService;

    public GymController(GymService gymService) {
        this.gymService = gymService;
    }

    // GET all gyms
    @GetMapping
    public List<Gym> getAllGyms() {
        return gymService.getAllGyms();
    }

    // GET gym by ID
    @GetMapping("/{id}")
    public Gym getGymById(@PathVariable Long id) {
        return gymService.getGymById(id)
                .orElseThrow(() -> new RuntimeException("Gym not found with id " + id));
    }

    // POST create gym
    @PostMapping
    public Gym createGym(@RequestBody Gym gym) {
        return gymService.createGym(gym);
    }

    // PUT update gym
    @PutMapping("/{id}")
    public Gym updateGym(@PathVariable Long id, @RequestBody Gym gym) {
        return gymService.updateGym(id, gym);
    }

    // DELETE gym
    @DeleteMapping("/{id}")
    public void deleteGym(@PathVariable Long id) {
        gymService.deleteGym(id);
    }
}
