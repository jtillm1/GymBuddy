<!DOCTYPE html>
<html>
<head>
    <title>Error Details</title>
    <style>
        body { font-family: monospace; background: #1a1a1a; color: #f0f0f0; padding: 40px; }
        h1 { color: #ff4444; }
        .box { background: #2a2a2a; border: 1px solid #444; border-radius: 8px; padding: 20px; margin: 20px 0; }
        label { color: #888; font-size: 12px; text-transform: uppercase; }
        p { color: #ffcc00; word-break: break-all; margin-top: 8px; }
    </style>
</head>
<body>
    <h1>⚠️ Error on /gyms</h1>
    <div class="box">
        <label>Exception</label>
        <p>${error!"(no error message)"}</p>
    </div>
    <#if cause??>
    <div class="box">
        <label>Caused By</label>
        <p>${cause}</p>
    </div>
    </#if>
    <a href="/" style="color: #c8ff00;">← Back to Home</a>
</body>
</html>