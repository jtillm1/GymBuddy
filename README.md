GymBuddy - MVC Application
A Spring MVC web application that provides backend API services for managing gyms, users, and reviews. The system enables users to explore gyms, submit reviews, and interact with gym data through RESTful endpoints.

---

## Architecture Overview

This application follows the Model-View-Controller (MVC) pattern:

---

## Models (Entities)

Located in `src/main/java/com/example/GymBuddy/model/`

User - Represents an application user with profile information and preferences
Gym - Represents a gym with location, pricing, and description
Review - Represents user feedback on gyms with optional gym replies

---

## Views (Templates)

Located in `src/main/resources/templates/`

Customer Pages:
* customer-auth.ftlh - Customer authentication and account access
* customer-landing.ftlh - Customer landing/dashboard page
* customer-review.ftlh - Customer review submission and interaction page
* customer-signin.ftlh - Customer sign-in page

Gym Pages:
* gym-dashboard.ftlh - Gym management dashboard
* gym-profile.ftlh - Displays gym information and profile details
* gym-reviews.ftlh - Displays gym reviews and review replies
* gym-setup.ftlh - Form to create and configure a gym
* gym-signin.ftlh - Gym authentication page

User Pages:
* user-form.ftlh - User creation and profile form
* users.ftlh - Displays all users and related information

Shared / Utility Pages:
* home.ftlh - Application landing page
* error-debug.ftlh - Debugging and error handling page

## Controllers

### API Controllers - RESTful endpoints for data operations:

Located in `src/main/java/com/example/GymBuddy/backendapi/`

GymController - Gym CRUD operations

* Retrieve all gyms
* Create and save gyms

ReviewController - Review management

* Create reviews
* Retrieve reviews
* Reply to reviews

UserController - User operations

* Create users
* Retrieve user data
* Manage user profile

---

## Services

Located in `src/main/java/com/example/GymBuddy/service/`

Business logic layer providing CRUD operations and domain functionality:

* GymService - Gym creation, retrieval, and management
* ReviewService - Review submission, retrieval, and reply handling
* UserService - User creation, profile management, and preference handling

---

## Repositories

Located in `src/main/java/com/example/GymBuddy/repository/`

Data access layer interfacing with the database (Spring Data JPA):

* GymRepository - Gym data access
* ReviewRepository - Review data access
* UserRepository - User data access

---

## Key Features

### User Functionality

* Create and manage user profiles
* Store preferences (location, workout style, budget)
* Browse available gyms
* Submit reviews for gyms
* View gym responses to reviews

### Gym Functionality

* Create and manage gym listings
* Provide gym details (price, description, location)
* View user reviews
* Reply to reviews

---

## Navigation / Endpoints

All pages use a unified FreeMarker template-based navigation system that automatically adjusts based on:

* User type (customer/gym)
* Authentication status
* Active page and dashboard context
* Responsive design using Bootstrap 5.3.2
* Dynamic routing between customer, gym, and public pages

The navigation system provides consistent access to:

* Home page
* Authentication pages
* Customer dashboard and review pages
* Gym dashboard and management pages
* User profile and account pages

---

## Session Management

* Basic session handling for user interactions
* Endpoints rely on request data for operations
* Authentication can be extended with Spring Security

---

## Database Relationships

Many-to-One:

* Review → User
* Review → Gym

One-to-Many (implied):

* User → Reviews
* Gym → Reviews

---
