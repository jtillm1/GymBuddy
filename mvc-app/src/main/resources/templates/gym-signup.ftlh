<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - GymBuddy</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <nav class="navbar">
        <div class="nav-left">
            <img src="/images/GymBuddy.png" class="nav-logo">
            <span class="nav-title">GymBuddy</span>
        </div>
    </nav>

    <div class="container">
        <h1 class="main-title">Create Your Account</h1>
        <p class="subtitle">Sign up to start managing your gym</p>

        <div class="card">
            <form action="/gym/signup" method="post">
                <div>
                    <label>Username</label>
                    <input type="text" name="username" required />
                </div>
                <div>
                    <label>Email</label>
                    <input type="email" name="email" required />
                </div>
                <div>
                    <label>Password</label>
                    <input type="password" name="password" required />
                </div>
                <div>
                    <label>Confirm Password</label>
                    <input type="password" name="confirmPassword" required />
                </div>
                <button type="submit">Sign Up</button>
            </form>
            <p>Already have an account? <a href="/gym/signin">Sign in</a></p>
        </div>
    </div>
</body>
</html>
