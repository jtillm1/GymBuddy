<!DOCTYPE html>
<html>
<head>
    <title>Customer Login</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>

<div class="form-container">
    <h2>Customer Login</h2>

    <!-- ❌ NO action="/users" anymore -->
    <form id="loginForm">

        <input type="email" id="email" placeholder="Email" required>

        <input type="password" id="password" placeholder="Password" required>

        <button type="submit">Continue</button>
    </form>

    <a href="/">Back to Home</a>
</div>

<script>
document.getElementById("loginForm").addEventListener("submit", function(e) {
    e.preventDefault(); // 🚨 prevents redirect to /users (fixes 404)

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
            window.location.href = "/gyms";
        })
        .catch(err => {
            alert(err.message);
        });
});
</script>

</body>
</html>