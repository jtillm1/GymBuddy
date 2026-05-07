<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Login - GymBuddy</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>

<nav class="navbar">
    <div class="nav-left">
        <img src="/GymBuddy.png" class="nav-logo">
        <span class="nav-title">GymBuddy</span>
    </div>
    <div class="nav-right">
        <a href="/">Home</a>
    </div>
</nav>

<img src="/GymBuddy.png" class="logo">
<h1 class="main-title">GymBuddy</h1>
<p class="subtitle">Customer Sign In</p>
<header class="hero"></header>

<div class="container">
    <div class="card">
        <h2>Sign In</h2>
        <form id="loginForm">
            <input type="email" id="email" placeholder="Email" required>
            <input type="password" id="password" placeholder="Password" required>
            <button type="submit">Sign In</button>
        </form>
        <a href="/signup"><button class="secondary">Create Account</button></a>
    </div>
</div>

<script>
document.getElementById("loginForm").addEventListener("submit", function(e) {
    e.preventDefault();
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;

    fetch("/api/users/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email: email, password: password })
    })
    .then(res => {
        if (!res.ok) throw new Error("Invalid email or password");
        return res.json();
    })
    .then(user => {
        localStorage.setItem("userId", user.id);
        localStorage.setItem("userName", user.name);
        localStorage.setItem("userLocation", user.location || "");
        window.location.href = "/gyms";
    })
    .catch(err => {
        alert(err.message);
    });
});
</script>

</body>
</html>
