<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Owner Sign In</title>
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
<h1 class="main-title">GymBuddy</h1>
<p class="subtitle">Owner Sign In</p>

<header class="hero"></header>

<div class="container">
    <div class="card">
        <h2>Sign In</h2>

        <form action="/owner/login" method="post">
            <input type="text" name="email" placeholder="Email" required><br><br>
            <input type="password" name="password" placeholder="Password" required><br><br>

            <button type="submit">Sign In</button>
        </form>

        <a href="/owner/auth">
            <button class="secondary">Create Account</button>
        </a>
    </div>
</div>

</body>
</html>