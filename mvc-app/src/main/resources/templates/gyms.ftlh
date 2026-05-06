<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Gyms - GymBuddy</title>
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



    <!-- Logo + Title -->
    <img src="/images/GymBuddy.png" alt="GymBuddy Logo" class="logo">
    <h1 class="main-title">GymBuddy</h1>
    <p class="subtitle">Browse all available gyms</p>

    <header class="hero"></header>

    <!-- Action Button -->
    <div style="text-align: center; margin: 20px;">
        <a href="/gyms/new">
            <button>Add New Gym</button>
        </a>
    </div>

    <!-- Gym List -->
    <div class="container">
        <#list gyms as gym>
            <div class="card">
                <h2>${gym.name}</h2>

                <p><strong>Description:</strong> ${gym.description}</p>
                <p><strong>Location:</strong> ${gym.location}</p>
                <p><strong>Price:</strong> $${gym.price}</p>

                </a>
            </div>
        </#list>
    </div>

</body>
</html>