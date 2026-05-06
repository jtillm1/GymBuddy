<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GymBuddy</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>

<img src="/GymBuddy.png" alt="GymBuddy Logo" class="logo">
<h1 class="main-title">GymBuddy</h1>
<p class="subtitle">Connecting people with gyms that match their fitness goals.</p>

<header class="hero"></header>

<section class="about">
    <h2>Why GymBuddy Was Created</h2>
    <p>
        Finding the right gym can be difficult. Every gym offers different
        equipment styles, membership plans, and amenities. GymBuddy was
        created to simplify the process by helping customers find gyms
        that align with their preferences while also allowing gym owners
        to showcase what makes their facility unique.
        <br><br>
        Features include:
        <br>
        • Allows customers to set location and price preferences<br>
        • Matches users with gyms based on equipment style<br>
        • Gives gym owners a platform to list amenities and plans<br>
        • Creates a structured comparison between gym options
    </p>
</section>

<div class="container">

    <!-- Customer Side -->
    <div class="card">
        <h2>Customer</h2>
        <p>Looking for the perfect gym?</p>

        <!-- ✅ Updated routes -->
        <a href="/signin">
            <button>Sign In</button>
        </a>

        <a href="/signup">
            <button class="secondary">Sign Up</button>
        </a>
    </div>

    <!-- Gym Owner Side -->
    <div class="card">
    <h2>Gym Owner</h2>
    <p>List your gym and connect with customers.</p>

    <a href="/gym/signin">
        <button>Sign In</button>
    </a>

    <a href="/gym/auth">
        <button class="secondary">Sign Up</button>
    </a>
    </div>
</div>

</body>
</html>