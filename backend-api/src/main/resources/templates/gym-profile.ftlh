<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile - GymBuddy</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>

<nav class="navbar">
    <div class="nav-left">
        <span class="nav-title">GymBuddy</span>
    </div>
    <div class="nav-right">
        <a href="/gym/dashboard">Dashboard</a>
        <a href="/gym/profile">Profile</a>
        <a href="/gym/reviews">Reviews</a>
        <a href="/"><button class="secondary">Sign Out</button></a>
    </div>
</nav>

<img src="/GymBuddy.png" class="logo">
<h1 class="main-title">Owner Profile</h1>
<header class="hero"></header>

<div class="container">
    <div class="card">
        <h2>${owner.name!""}</h2>
        <p><strong>Location:</strong> ${owner.location!""}</p>
        <p><strong>Price:</strong> $${owner.price!0} / month</p>
        <p><strong>Description:</strong> ${owner.description!""}</p>
        <a href="/gym/dashboard"><button>Back to Dashboard</button></a>
    </div>
</div>

</body>
</html>
