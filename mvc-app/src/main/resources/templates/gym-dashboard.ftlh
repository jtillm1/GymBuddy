<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Owner Dashboard</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<nav class="navbar">
    <div class="nav-left">
        <img src="/images/GymBuddy.png" class="nav-logo">
        <span class="nav-title">GymBuddy</span>
    </div>
    <div class="nav-right">
        <a href="/gym/dashboard">Dashboard</a>
        <a href="/gym/profile">Profile</a>
        <a href="/gyms">Gyms</a>
        <a href="/gym/reviews">Reviews</a>
        <a href="/logout">
            <button class="secondary">Logout</button>
        </a>
    </div>
</nav>

<h1 class="main-title">Dashboard</h1>
<p class="subtitle">Manage your gyms</p>

<header class="hero"></header>

<div class="container">

    <#list gyms as gym>
        <div class="card">
            <h2>${gym.name}</h2>
            <p><strong>Location:</strong> ${gym.location}</p>
            <p><strong>Price:</strong> $${gym.price}</p>
            <p><strong>Description:</strong> ${gym.description}</p>

            <!-- Profile button -->
            <a href="/gym/profile">
                <button>View Profile</button>
            </a>

            <!-- Reviews section for this gym -->
            <div class="reviews-preview">
                <h3>Recent Reviews</h3>

                <#list gym.reviews as review>
                    <div class="review-card">
                        <p><strong>Rating:</strong> ${review.rating}/5</p>
                        <p>${review.comment}</p>
                        <#if review.reply?has_content>
                            <p><em>Owner reply: ${review.reply}</em></p>
                        </#if>
                    </div>
                <#else>
                    <p>No reviews yet.</p>
                </#list>

            </div>

            <!-- Reviews page button -->
            <a href="/gym/reviews">
                <button class="secondary">See All Reviews</button>
            </a>
        </div>
    </#list>

</div>

</body>
</html>