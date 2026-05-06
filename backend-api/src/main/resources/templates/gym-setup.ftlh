<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Setup Gym</title>
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
<h1 class="main-title">Setup Your Gym</h1>

<header class="hero"></header>

<div class="container">
    <div class="card">
        <form action="/owner/setup" method="post">

            <input type="text" name="name" placeholder="Gym Name" required><br><br>
            <input type="text" name="location" placeholder="Location" required><br><br>
            <input type="number" name="price" placeholder="Monthly Price" required><br><br>

            <textarea name="description" placeholder="Description"></textarea><br><br>

            <button type="submit">Save Gym</button>
        </form>
    </div>
</div>

</body>
</html>