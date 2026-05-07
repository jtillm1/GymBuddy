<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Sign Up - GymBuddy</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>

<nav class="navbar">
    <div class="nav-left">
        
        <span class="nav-title">GymBuddy</span>
    </div>
    <div class="nav-right">
        <a href="/">Home</a>
    </div>
</nav>

<img src="/GymBuddy.png" class="logo">
<h1 class="main-title">GymBuddy</h1>
<p class="subtitle">Create Your Account</p>
<header class="hero"></header>

<div class="container">
    <div class="card">
        <h2>Sign Up</h2>
        <form id="signupForm">
            <input type="text" id="name" placeholder="Full Name" required>
            <input type="email" id="email" placeholder="Email" required>
            <input type="password" id="password" placeholder="Password" required>
            <label>Workout Style</label>
            <select id="workoutStyle" required>
                <option value="">Select a style</option>
                <option value="Bodybuilding">Bodybuilding</option>
                <option value="Powerlifting">Powerlifting</option>
                <option value="CrossFit">CrossFit</option>
                <option value="General Fitness">General Fitness</option>
            </select>
            <input type="text" id="location" placeholder="Your City" required>
            <input type="number" id="maxBudget" placeholder="Max Budget ($)" required>
            <button type="submit">Create Account</button>
        </form>
        <a href="/signin"><button class="secondary">Already have an account?</button></a>
    </div>
</div>

<script>
document.getElementById("signupForm").addEventListener("submit", function(e) {
    e.preventDefault();
    const user = {
        name: document.getElementById("name").value,
        email: document.getElementById("email").value,
        password: document.getElementById("password").value,
        workoutStyle: document.getElementById("workoutStyle").value,
        location: document.getElementById("location").value,
        maxBudget: parseFloat(document.getElementById("maxBudget").value)
    };
    fetch("/api/users/register", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(user)
    })
    .then(res => res.json())
    .then(() => { window.location.href = "/signin"; })
    .catch(err => { alert("Signup failed"); });
});
</script>

</body>
</html>
