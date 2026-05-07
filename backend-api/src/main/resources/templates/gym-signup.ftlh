<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - GymBuddy</title>
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

    <div class="form-container">
        <h2>Create Owner Account</h2>
        <form action="/gym/signup" method="post">
            <label>Email</label>
            <input type="email" name="email" required />
            <label>Password</label>
            <input type="password" name="password" required />
            <button type="submit">Sign Up</button>
        </form>
        <a href="/gym/signin">Already have an account?</a>
    </div>
</body>
</html>