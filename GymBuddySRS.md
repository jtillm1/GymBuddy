
# Requirements – Starter Template

**Project Name:** GymBuddy \
**Team:** Jace Tillman - Customer, Joseph Osoh - Provider \
**Course:** CSC 340\
**Version:** 1.0\
**Date:** 2026-01-30

---

## 1. Overview
**Vision.** GymBuddy is an application that directly tailors your needs to find a gym that perfectly suits you. 

**Glossary** Terms used in the project
- **Term 1:** 
- **Term 2:** description

**Primary Users / Roles.**
- **Customer** — Enters information tailored to their fitness needs. 
- **Provider (e.g., Teacher/Doctor/Pet Sitter/etc. )** —  
- **SysAdmin (optional)** — 1 line goal statement.

**Scope (this semester).**
- <capability 1> Subscribe to gyms and services through the app. 
- <capability 2> Uses user location to filter out gyms in their preferred radius.
- <capability 3> Reviews on both the app and on other sites
- <capability 4> Gym owners promote business and their benefits

**Out of scope (deferred).**
- <deferred 1>
- <deferred 2>

> This document is **requirements‑level** and solution‑neutral; design decisions (UI layouts, API endpoints, schemas) are documented separately.

---

## 2. Functional Requirements (User Stories)
Write each story as: **As a `<role>`, I want `<capability>`, so that `<benefit>`.** Each story includes at least one **Given/When/Then** scenario.

### 2.1 Customer Stories
- **US‑CUST‑001 — <Distance Filter>**  
  _Story:_ As a customer I want to filter gyms in a specific radius so I won't have to travel far.  
  _Acceptance:_
  ```gherkin
  Scenario: <happy path>
    Given Multiple gyms tailor my needs. 
    When  I filter within a certain radius. 
    Then Gyms appear closest first.
  ```

- **US‑CUST‑002 — <Beginner Friendly>**  
  _Story:_ As a customer, I want to filter gyms by “beginner-friendly” so I don’t feel intimidated. 
  _Acceptance:_
  ```gherkin
  Scenario: <happy path>
    Given Gyms in the area. 
    When  I specify beginner friendly. 
    Then It shows me gyms in my area that are known for being beginner friendly. 
  ```
  - **US‑CUST‑003 — <Filtered Reviews>**  
  _Story:_ As a customer, I want reviews filtered by category (cleanliness, equipment quality, crowd, staff).
  _Acceptance:_
  ```gherkin
  Scenario: <happy path>
    Given Reviews that are given by other customers. 
    When  I specify a category. 
    Then It shows me reviews with the certain category (e.g. keywords, repeated phrases) 
  ```

### 2.2 Provider Stories
- **US‑PROV‑001 — <short title>**  
  _Story:_ Story: As a Gym, I want to create/update my gym profile (bio, location, memberships/plans, equipment, fitness trainers, and photos of facilities) so that customers understand our operation.
  _Acceptance:_
  ```gherkin
  Scenario: <happy path>
    Given I am a verified provider
    When I add or update profile details
    Then the profile is saved and visible on the gym page
  ```

- **US‑PROV‑002 — <short title>**  
  _Story:_ As a Gym owner, I want to create a gym membership or plan with a title, seasonal benefits, and a monthly price so customers can subscribe.
  _Acceptance:_
  ```gherkin
  Scenario: <happy path>
    Given <preconditions>
    When  <action>
    Then  <observable outcome>
  ```
  **US‑PROV‑003 — <short title>**  
  _Story:_ Story: As a gym owner, I want to post a public reply to a customer review so that I can acknowledge feedback and share context.
  _Acceptance:_
  ```gherkin
  Scenario: <happy path>
    · Scenario: Reply to a review

· Given a published review exists for my box

· When I submit a reply

Then the reply appears publicly beneath the review (subject to moderation)
  ```

### 2.3 SysAdmin Stories
- **US‑ADMIN‑001 — <short title>**  
  _Story:_ As a sysadmin, I want … so that …  
  _Acceptance:_
  ```gherkin
  Scenario: <happy path>
    Given <preconditions>
    When  <action>
    Then  <observable outcome>
  ```

- **US‑ADMIN‑002 — <short title>**  
  _Story:_ As a sysadmin, I want … so that …  
  _Acceptance:_
  ```gherkin
  Scenario: <happy path>
    Given <preconditions>
    When  <action>
    Then  <observable outcome>
  ```

---

## 3. Non‑Functional Requirements (make them measurable)
- **Performance:** Gym search results should return in < 1.5 seconds for 95% of queries. 
- **Availability/Reliability:** The system should have 99.5% uptime or greater.
- **Security/Privacy:** Passwords must be hashed.
- **Usability:** Core features (search, filter, review) must be accessible within 3 taps.

---

## 4. Assumptions, Constraints, and Policies
- list any rules, policies, assumptions, etc.

---· Users access the app through modern browsers or mobile devices with stable internet.---

Constraints

· Development must follow course timeline and academic infrastructure limits.

---

Matching & Data Policy

· Gym recommendations are generated based on user preferences (location, budget, equipment style, trainer availability).

---

Content & Account Policy

· No harassment, spam, false listings, or posting of sensitive personal information (PII).

## 5. Milestones (course‑aligned)
- M2 – Requirements

· Completed requirements document and defined core user stories for the gym-matching app.

---

M3 – High-Fidelity Prototype

· Developed a clickable prototype demonstrating core user flows (register, set preferences, search gyms, view details).

---

M4 – System Design

· Designed system architecture, database schema, and API structure for the application.

---

M5 – Backend API

· Implemented core backend endpoints with authentication, database integration, and testing.

---

M6 – Increment

· Delivered at least two complete end-to-end use cases within the system.

---

M7 – Final

· Completed fully functional gym-matching system with documentation and final presentation.

---

## 6. Change Management
- Stories are living artifacts; changes are tracked via repository issues and linked pull requests.  
- Major changes should update this SRS.
