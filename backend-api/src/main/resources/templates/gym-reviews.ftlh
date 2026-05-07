<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reviews - GymBuddy</title>
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
    <h2>Reviews</h2>

    <#if reviews?? && (reviews?size > 0)>
        <ul>
        <#list reviews as review>
            <li>
                <strong>${(review.user.name)!""}</strong>
                <span style="float:right; color: var(--accent);">
                    <#list 1..review.rating as i>★</#list><#list review.rating..4 as i>☆</#list>
                </span>
                <br>
                <span style="font-size: 0.78rem; color: var(--text-muted);">${review.category!""}</span>
                <p style="margin-top: 6px;">${review.comment!""}</p>

                <#if review.reply??>
                    <div class="owner-reply">
                        <strong>Your Reply:</strong>
                        <p>${review.reply}</p>
                    </div>
                <#else>
                    <form action="/owner/review/${review.id}/reply" method="post" style="margin-top: 10px;">
                        <input type="text" name="reply" placeholder="Write a reply..." required
                               style="width: 100%; padding: 8px 12px; background: var(--bg-primary);
                                      border: 1px solid var(--border); border-radius: 4px;
                                      color: var(--text-primary); font-family: 'DM Sans', sans-serif;
                                      font-size: 0.82rem; outline: none;">
                        <button type="submit" style="margin-top: 8px; padding: 6px 16px;
                                font-size: 0.75rem; width: auto;">Reply</button>
                    </form>
                </#if>
            </li>
        </#list>
        </ul>
    <#else>
        <p style="color: var(--text-muted);">No reviews yet.</p>
    </#if>
</div>

</body>
</html>