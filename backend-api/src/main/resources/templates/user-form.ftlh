<!DOCTYPE html>
<html>
<head>
    <title>Create User</title>
</head>
<body>

<h1>Create User</h1>

<form action="/users" method="post">
    <label>Name:</label><br>
    <input type="text" name="name" required><br><br>

    <label>Email:</label><br>
    <input type="email" name="email" required><br><br>

    <button type="submit">Create User</button>
</form>

<br>
<a href="/users">Back to Users</a>

</body>
</html>