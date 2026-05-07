<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - GymBuddy</title>
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
    <h2>Your Gyms</h2>

    <#if gyms?? && (gyms?size > 0)>
        <ul>
        <#list gyms as gym>
            <li>
                <strong>${gym.name!""}</strong>
                ${gym.location!""} &nbsp;·&nbsp; $${gym.price!0} / month<br>
                <span style="font-size:0.78rem; color: var(--text-muted);">${gym.description!""}</span>
                <div style="margin-top: 10px; display: flex; gap: 8px;">
                    <a href="/owner/gym/${gym.id}" style="text-decoration:none;">
                        <button type="button" style="padding: 6px 16px; font-size: 0.75rem; width: auto;">Manage</button>
                    </a>
                    <a href="/gyms/delete/${gym.id}" style="text-decoration:none;">
                        <button type="button" class="secondary" style="padding: 6px 16px; font-size: 0.75rem; width: auto;">Delete</button>
                    </a>
                </div>
            </li>
        </#list>
        </ul>
    <#else>
        <p style="color: var(--text-muted); margin-bottom: 24px;">You have no gyms listed yet.</p>
    </#if>

    <a href="/gyms/new">+ Add New Gym</a>
</div>

</body>
</html>