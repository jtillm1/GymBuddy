<!DOCTYPE html>
<html>
<head>
    <title>Customer Sign Up</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>

<div class="form-container">
    <h2>Customer Sign Up</h2>

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

        <button type="submit">Continue</button>
    </form>

    <a href="/">Back to Home</a>
</div>

<script>
document.getElementById("signupForm").addEventListener("submit", function(e) {
    e.preventDefault(); // 🚨 prevents 404 redirect

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
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(user)
    })
    .then(res => res.json())
    .then(() => {
        // ✅ redirect after success
        window.location.href = "/gyms";
    })
    .catch(err => {
        console.error(err);
        alert("Signup failed");
    });
});
</script>

</body>
</html>