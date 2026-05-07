<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Owner Sign In - GymBuddy</title>
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
<p class="subtitle">Owner Sign In</p>
<header class="hero"></header>

<div class="container">
    <div class="card">
        <h2>Sign In</h2>
        <#if error??>
            <p style="color: red;">${error}</p>
        </#if>
        <form action="/owner/login" method="post">
            <input type="email" name="email" placeholder="Email" required><br><br>
            <input type="password" name="password" placeholder="Password" required><br><br>
            <button type="submit">Sign In</button>
        </form>
        <a href="/gym/auth"><button class="secondary">Create Account</button></a>
    </div>
</div>

</body>
</html>
