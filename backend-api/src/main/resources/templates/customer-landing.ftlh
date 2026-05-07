<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gyms Near You - GymBuddy</title>
    <link rel="stylesheet" href="/style.css">
    <style>
        .filters {
            display: flex;
            gap: 12px;
            margin-bottom: 24px;
            flex-wrap: wrap;
        }
        .filters input {
            flex: 1;
            min-width: 140px;
        }
        .filters button {
            flex: 0;
            padding: 10px 20px;
        }
        #no-results {
            display: none;
            color: var(--text-secondary);
            margin-top: 16px;
        }
    </style>
</head>
<body>

<nav class="navbar">
    <div class="nav-left">
        <img src="/GymBuddy.png" class="nav-logo">
        <span class="nav-title">GymBuddy</span>
    </div>
    <div class="nav-right">
        <a href="/gyms">Gyms</a>
        <a href="/" onclick="localStorage.clear()"><button class="secondary">Sign Out</button></a>
    </div>
</nav>

<div class="form-container">
    <h2>Gyms in your area:</h2>

    <div class="filters">
        <input type="text" id="cityFilter" placeholder="Filter by city (e.g. Charlotte)" />
        <input type="number" id="maxPrice" placeholder="Max price per month" min="0" />
        <button onclick="applyFilters()">Search</button>
        <button onclick="clearFilters()" style="background: transparent; border: 1px solid var(--border); color: var(--text-secondary);">Clear</button>
    </div>

    <ul id="gym-list">
    <#if gyms?? && (gyms?size > 0)>
        <#list gyms as gym>
        <li class="gym-item"
            data-location="${gym.location!''}"
            data-price="${gym.price!0}">
            <a href="/reviews?gymId=${gym.id!0}&gym=${gym.name?url}" class="gym-link">
                <strong>${gym.name!""}</strong><br>
                $${gym.price!0} a month<br>
                ${gym.location!""}<br>
                ${gym.description!""}
            </a>
            <#if gym.website?? && gym.website != "">
                <a href="${gym.website}" target="_blank" style="font-size: 0.78rem; color: var(--accent); margin-top: 4px; display: inline-block;">Visit Website →</a>
            </#if>
        </li>
        </#list>
    <#else>
        <p>No gyms available</p>
    </#if>
    </ul>

    <p id="no-results">No gyms match your filters.</p>
</div>

<script>
    function applyFilters() {
        const city = document.getElementById("cityFilter").value.trim().toLowerCase();
        const maxPrice = parseFloat(document.getElementById("maxPrice").value);
        const items = document.querySelectorAll(".gym-item");
        let visibleCount = 0;

        items.forEach(item => {
            const gymCity = item.dataset.location.split(",")[0].trim().toLowerCase();
            const price = parseFloat(item.dataset.price);
            const cityMatch = !city || gymCity.includes(city) || city.includes(gymCity);
            const priceMatch = isNaN(maxPrice) || price <= maxPrice;

            if (cityMatch && priceMatch) {
                item.style.display = "";
                visibleCount++;
            } else {
                item.style.display = "none";
            }
        });

        document.getElementById("no-results").style.display = visibleCount === 0 ? "block" : "none";
    }

    function clearFilters() {
        document.getElementById("cityFilter").value = "";
        document.getElementById("maxPrice").value = "";
        document.querySelectorAll(".gym-item").forEach(item => item.style.display = "");
        document.getElementById("no-results").style.display = "none";
    }

    const userLocation = localStorage.getItem("userLocation");
    if (userLocation) {
        document.getElementById("cityFilter").value = userLocation;
        applyFilters();
    }

    document.getElementById("cityFilter").addEventListener("keyup", e => { if (e.key === "Enter") applyFilters(); });
    document.getElementById("maxPrice").addEventListener("keyup", e => { if (e.key === "Enter") applyFilters(); });
</script>

</body>
</html>
