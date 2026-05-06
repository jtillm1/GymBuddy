<!DOCTYPE html>
<html>
<head>
    <title>Create Gym</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<nav class="navbar">
    <div class="nav-left">
        <img src="/images/GymBuddy.png" class="nav-logo">
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
<h1>Create Gym</h1>

<form action="/gyms" method="post">

    <label>Name:</label>
    <input type="text" name="name" required><br><br>

    <label>Description:</label>
    <textarea name="description" required></textarea><br><br>

    <label>Location:</label>
    <input type="text" name="location" required><br><br>

    <label>Price:</label>
    <input type="number" name="price" step="0.01" min="0" required><br><br>

    <button type="submit">Save Gym</button>

</form>

<br>
<a href="/gyms">Back to Gyms</a>

</body>
</html>