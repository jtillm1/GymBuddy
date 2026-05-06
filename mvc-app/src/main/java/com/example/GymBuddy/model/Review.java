package com.example.GymBuddy.model;

import jakarta.persistence.*;

@Entity
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int rating;
    private String comment;

    private String reply;
    private String replyDate;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "gym_id")
    private Gym gym;

    public Review() {}

    public Long getId() { return id; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public String getReply() { return reply; }
    public void setReply(String reply) { this.reply = reply; }

    public String getReplyDate() { return replyDate; }
    public void setReplyDate(String replyDate) { this.replyDate = replyDate; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public Gym getGym() { return gym; }
    public void setGym(Gym gym) { this.gym = gym; }
}