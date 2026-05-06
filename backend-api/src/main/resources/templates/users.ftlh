<!DOCTYPE html>
<html>
<head>
    <title>GymBuddy - Profile</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<h1>User Profiles</h1>

<div class="profiles">

    <#if users?size == 0>
        <p>No users found</p>
    <#else>

        <#list users as user>

        <div class="profile-card">
            <h2>${user.name}</h2>

            <p><strong>Email:</strong> ${user.email}</p>
            <p><strong>Location:</strong> ${user.location}</p>
            <p><strong>Workout Style:</strong> ${user.workoutStyle}</p>
            <p><strong>Budget:</strong> $${user.maxBudget}</p>

        </div>

        </#list>

    </#if>

</div>
<#list users as user>
  <p>${user}</p>
</#list>
</body>
</html>