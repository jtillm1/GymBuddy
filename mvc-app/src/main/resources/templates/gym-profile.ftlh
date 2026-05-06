<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Owner Profile</title>
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
<h1 class="main-title">Profile</h1>

<header class="hero"></header>

<div class="container">
    <div class="card">
        <h2>${owner.name}</h2>
        <p>Email: ${owner.email}</p>

        <a href="/owner/edit">
            <button>Edit Profile</button>
        </a>
    </div>
</div>

</body>
</html>