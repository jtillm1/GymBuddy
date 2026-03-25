# LocalHarvest Hub - Backend API Documentation

**Version:** 1.0
**Last Updated:** March 4, 2026
**Base URL:** `http://localhost:8080/api`

---

## Table of Contents

1. [Overview](#1-overview)
2. [User Roles](#2-user-roles)
3. [UML Class Diagram](#3-uml-class-diagram)
4. [API Endpoints](#4-api-endpoints)
   - [Customer Management](#customer-management)
   - [Farmer/Provider Management](#farmerprovider-management)
   - [Farm Management](#farm-management)
   - [Produce Box Management](#produce-box-management)
   - [Subscription Management](#subscription-management)
   - [Review Management](#review-management)
   - [System Admin Management](#system-admin-management)
   - [Audit Logs](#audit-logs)
5. [Use Case Mapping](#5-use-case-mapping)

---
## 1. Overview
The LocalHarvest Hub Backend API provides a RESTful interface for managing: 

- **User Accounts**: Customer, and Gym Owner roles
- **Gym Profiles**: Information about gyms and their equipment
- **Reviews**: Customer feedback on gym quality and equipments

---
## 2. User Roles
The API supports three primary user roles:

| Role | Description | Primary Responsibilities |
|------|-------------|-------------------------|
| **CUSTOMER** | Person looking for gym | Browse gyms, write reviews |
| **FARMER** | Gym owners | Create gym profile, read and respond to reviews |

---
## 3. UML Class Diagram
![UML Class Diagram](GymBuddy/docs/GymBuddy UML.png)

## 4. API Endpoints

### Customer Management
#### Create Customer
**Endpoint:** `POST /users/register`
**Use Case:** US-CUST-001 (Register as Customer)
**Description:** Create a new customer account with profile information.

```http
POST /customers
Content-Type: application/json

{
  "name": "Peter",
  "email": "Pete@email.com",
  "password": "1234",
  "role": "CUSTOMER",
  "location": "NC",
  "workoutStyle": "Bodybuilding",
  "maxBudget": 44.99
}



```

**Response:**
```json
{
	"email": "Petes.ruckgvgfcv@mthoxc.zw.com",
	"id": 6,
	"location": "NC",
	"maxBudget": 44.99,
	"name": "Peter",
	"password": "1234",
	"role": "CUSTOMER",
	"workoutStyle": "Bodybuilding"
}
```

**Status Code:** `201 Created`

---

#### Get All Customers
**Endpoint:** `GET /users`
**Use Case:** Admin user management
**Description:** Retrieve all customer accounts.

```http
GET /customers
```

**Status Code:** `200 OK`

---

#### Get Customer by ID
**Endpoint:** `GET /users/{id}`
**Use Case:** Customer profile view
**Description:** Retrieve specific customer by ID.

```http
GET /customers/1
```

**Status Code:** `200 OK` or `404 Not Found`


---

#### Update Customer
**Endpoint:** `PUT /users/{id}`
**Use Case:** US-CUST-001 (Update Profile)
**Description:** Update customer profile information.

```http
PUT /users/1
Content-Type: application/json

{
"name": "Jace Updated",
"email": "new@email.com",
"password": "1234",
"role": "CUSTOMER",
"location": "NC",
"workoutStyle": "Bodybuilding",
"maxBudget": 70
}

```

**Response:** Updated customer object

**Status Code:** `200 OK` or `404 Not Found`

---

#### Delete Customer
**Endpoint:** `DELETE /users/{id}`
**Use Case:** Account deletion
**Description:** Delete customer account.

```http
DELETE /customers/1
```

**Status Code:** `204 No Content` or `404 Not Found`

---
### Gym/Provider Management

#### Create Gym
**Endpoint:** `POST /gyms`
**Description:** Create a new gym account.

```http
POST /gyms
Content-Type: application/json

{
  "name": "Gold's Gym",
  "location": "Greensboro, NC",
  "price": "29.99",
  "description": "Great gym with lots of equipment and trainers"
}



```

**Response:**
```json
{
	"description": "Great gym with lots of equipment and trainers",
	"id": 3,
	"location": "Greensboro, NC",
	"name": "Greens's Gym",
	"price": 29.99
}
```

**Status Code:** `201 Created`

---

#### Get All Farmers
**Endpoint:** `GET /gyms`
**Use Case:** Browse providers
**Description:** Retrieve all gym accounts.

```http
GET /gyms
```

**Status Code:** `200 OK`

---

#### Get Gym by ID
**Endpoint:** `GET /gyms/{id}`
**Use Case:** Gym profile view
**Description:** Retrieve specific gym by ID.

```http
GET /gyms/2
```

**Status Code:** `200 OK` or `404 Not Found`


---

#### Update Gym
**Endpoint:** `PUT /gyms/{id}`
**Description:** Update gym profile information.

```http
PUT /gyms/2
Content-Type: application/json

{
  "bio": "Third Generation Farmer specializing in organic vegetables. Passionate about sustainable agriculture and community engagement.",
  "status": "ACTIVE"
}
```

**Response:** 

**Status Code:** `200 OK` or `404 Not Found`

---

#### Delete Gyms
**Endpoint:** `DELETE /gyms/{id}`
**Use Case:** Account deletion
**Description:** Delete gym account.

```http
DELETE /gyms/2
```

**Status Code:** `204 No Content` or `404 Not Found`

---


### Review Management

#### Create Review
**Endpoint:** `POST /reviews?userId=_&gymId=_`
**Use Case:** US-CUST-007 (Write a Review)
**Description:** Create a new review for a completed subscription.

```http
POST /reviews
Content-Type: application/json

{
  "rating": 5,
  "comment": "Great gym, good equipment"
}

```

**Response:**
```json
{
	"comment": "Great gym, good equipment",
	"gym": {
		"description": "Great gym with all the equipment you would need, has powerlifting equipment as well. ",
		"id": 2,
		"location": "Greensboro, NC",
		"name": "Strength and Bodu",
		"price": 29.99
	},
	"id": 3,
	"rating": 5,
	"user": {
		"email": "jace@email.com",
		"id": 2,
		"location": "NC",
		"maxBudget": 50,
		"name": "Jace",
		"password": "1234",
		"role": "CUSTOMER",
		"workoutStyle": "Powerlifting"
	}
}
```


**Status Code:** `201 Created`

---

#### Get All Reviews
**Endpoint:** `GET /reviews`
**Use Case:** US-CUST-008 (Read Reviews)
**Description:** Retrieve all reviews in the system.

```http
GET /reviews
```

**Status Code:** `200 OK`

---

#### Get Review by User ID
**Endpoint:** `GET /reviews/users/{id}`
**Use Case:** Review detail view
**Description:** Retrieve specific review.

```http
GET /reviews/users/201
```

**Status Code:** `200 OK` or `404 Not Found`

---

#### Get Review by Gym ID
**Endpoint:** `GET /reviews/gyms/{id}`
**Use Case:** Review detail view
**Description:** Retrieve specific review.

```http
GET /reviews/gyms/201
```

**Status Code:** `200 OK` or `404 Not Found`

---
#### Reply to Review
**Endpoint:** `PUT /{reviewId}/reply`
**Description:** Reply to Reviews

```http
PUT /{reviewId}/reply
Content-Type: application/json

{
  "reply": "Thanks for training with us!"
}

```

#### Delete Review
**Endpoint:** `DELETE /reviews/{id}`
**Description:** Delete a review .

```http
DELETE /reviews/201
```

**Status Code:** `204 No Content` or `404 Not Found`

---

## 5. Use Case Mapping
The API endpoints are designed to support the following SRS use cases:

### Customer Use Cases

| Use Case | Description | Related Endpoints |
|----------|-------------|-------------------|
| **US-CUST-001** | Register & manage customer profile | `POST /users/register`, `PUT /users/{id}` |
| **US-CUST-002** | Browse gym profiles | `GET /gyms`, `GET /gyms/{id}` |
| **US-CUST-003** | Write a review | `POST /reviews?userId={userId}&gymId={gymId}` |
| **US-CUST-004** | Read reviews | `GET /reviews/{userId}`, `GET /reviews/{gymId}` |

### Provider (Gym) Use Cases

| Use Case | Description | Related Endpoints |
|----------|-------------|-------------------|
| **US-FARM-001** | Register & manage gym profile | `POST /gyms`, `PUT /gyms/{id}`, `PUT /gyms/{gymId}` |
| **US-FARM-006** | View customer reviews | `GET /reviews/{gymId}` |
| **US-FARM-007** | Reply to customer reviews | `PUT /reviews/{reviewId}/reply` |
