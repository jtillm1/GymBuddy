<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Gym - GymBuddy</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>

<nav class="navbar">
    <div class="nav-left">
        <img src="/GymBuddy.png" class="nav-logo">
        <span class="nav-title">GymBuddy</span>
    </div>
    <div class="nav-right">
        <a href="/gym/dashboard">Dashboard</a>
        <a href="/gym/profile">Profile</a>
        <a href="/gym/reviews">Reviews</a>
        <a href="/"><button class="secondary">Sign Out</button></a>
    </div>
</nav>

<div class="form-container">
    <h2>Manage Gym</h2>
    <form action="/gyms" method="post">
        <input type="hidden" name="id" value="${gym.id!0}">
        <input type="text" name="name" placeholder="Gym Name" value="${gym.name!''}" required><br><br>
        <input type="text" name="location" placeholder="Location" value="${gym.location!''}" required><br><br>
        <input type="number" name="price" placeholder="Monthly Price" value="${gym.price!0}" required><br><br>
        <textarea name="description" placeholder="Description">${gym.description!''}</textarea><br><br>
        <input type="text" name="website" placeholder="Website URL (e.g. https://yourgym.com)" value="${gym.website!''}"><br><br>
        <button type="submit">Save Changes</button>
    </form>
    <a href="/gym/dashboard">← Back to Dashboard</a>
</div>

</body>
</html>