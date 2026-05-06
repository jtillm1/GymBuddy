<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reviews</title>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
<nav class="navbar">
    <div class="nav-left">
        <img src="static/js/images/GymBuddy.png" class="nav-logo">
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

<img src="static/js/images/GymBuddy.png" class="logo">
<h1 class="main-title">Reviews</h1>

<header class="hero"></header>

<div class="container">

    <#list reviews as review>
        <div class="card">
            <p><strong>${review.user}</strong></p>
            <p>${review.comment}</p>
            <p>Rating: ${review.rating}</p>
        </div>
    </#list>

</div>

</body>
</html>