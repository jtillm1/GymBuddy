<!DOCTYPE html>
<html>
<head>
    <title>Leave a Review</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>

<div class="form-container">

    <h2 id="gym-title">Leave a Review</h2>

    <!-- ⭐ Review Form -->
    <form id="reviewForm">

        <label>Your Rating</label>
        <div class="star-rating">
            <span class="star" data-value="1">★</span>
            <span class="star" data-value="2">★</span>
            <span class="star" data-value="3">★</span>
            <span class="star" data-value="4">★</span>
            <span class="star" data-value="5">★</span>
        </div>
        <input type="hidden" id="ratingValue" value="0">

        <label>Your Name</label>
        <input type="text" id="reviewerName" placeholder="e.g. John D." required>

        <label>Category</label>
        <select id="reviewCategory" required>
            <option value="">Select category</option>
            <option value="cleanliness">Cleanliness</option>
            <option value="equipment">Equipment</option>
            <option value="crowd">Crowd</option>
            <option value="staff">Staff</option>
        </select>

        <label>Your Review</label>
        <textarea id="reviewText" rows="5" required></textarea>

        <button type="submit">Submit Review</button>
    </form>

    <!-- 🔍 Filter -->
    <label>Filter by Category</label>
    <select id="categoryFilter">
        <option value="">All</option>
        <option value="cleanliness">Cleanliness</option>
        <option value="equipment">Equipment</option>
        <option value="crowd">Crowd</option>
        <option value="staff">Staff</option>
    </select>

    <!-- 📋 Reviews -->
    <div id="reviews-section">
        <h3 class="reviews-heading">Recent Reviews</h3>
        <ul id="reviews-list" class="reviews-list"></ul>
    </div>

    <a href="/gyms">← Back to Gyms</a>
</div>

<script>
    const params = new URLSearchParams(window.location.search);

    const gymId = params.get('gymId');
    const gymName = params.get('gym') || "Unknown Gym";

    document.getElementById('gym-title').textContent = "Reviews for " + gymName;

    // ⭐ Star Rating Logic
    const stars = document.querySelectorAll('.star');
    let selectedRating = 0;

    stars.forEach(star => {
        star.addEventListener('mouseover', () => highlightStars(star.dataset.value));
        star.addEventListener('mouseout', () => highlightStars(selectedRating));
        star.addEventListener('click', () => {
            selectedRating = parseInt(star.dataset.value);
            document.getElementById('ratingValue').value = selectedRating;
            highlightStars(selectedRating);
        });
    });

    function highlightStars(count) {
        stars.forEach(s => {
            s.classList.toggle('active', s.dataset.value <= count);
        });
    }

    // 🔄 Load Reviews
    function loadReviews() {
        const category = document.getElementById("categoryFilter").value;

        let url = "/api/reviews/gym/" + gymId;
        if (category) {
            url += "?category=" + category;
        }

        fetch(url)
            .then(res => {
            if (!res.ok) {
                return res.text().then(text => { throw new Error("Server " + res.status + ": " + text); });
            }
            return res.json();
        })
            .then(data => {
                const list = document.getElementById('reviews-list');
                list.innerHTML = '';

                if (!data || data.length === 0) {
                    list.innerHTML = '<p>No reviews yet.</p>';
                    return;
                }

                data.forEach(review => {
                    const li = document.createElement('li');
                    li.className = "review-card";

                    const stars = '★'.repeat(review.rating) + '☆'.repeat(5 - review.rating);
                    const replyHtml = review.reply
                        ? '<div class="owner-reply"><strong>Owner Reply:</strong><p>' + review.reply + '</p></div>'
                        : '';

                    li.innerHTML =
                        '<div class="review-header">' +
                        '<span class="review-author">' + (review.user && review.user.name ? review.user.name : "Anonymous") + '</span>' +
                        '<span class="review-stars">' + stars + '</span>' +
                        '</div>' +
                        '<p><strong>Category:</strong> ' + (review.category || "N/A") + '</p>' +
                        '<p class="review-text">' + review.comment + '</p>' +
                        replyHtml;

                    list.appendChild(li);
                });
            });
    }

    loadReviews();

    // 🔁 Filter change reload
    document.getElementById("categoryFilter").addEventListener("change", loadReviews);

    // 📝 Submit Review
    document.getElementById('reviewForm').addEventListener('submit', function(e) {
        e.preventDefault();

        const rating = parseInt(document.getElementById('ratingValue').value);
        const comment = document.getElementById('reviewText').value.trim();
        const category = document.getElementById('reviewCategory').value;

        if (rating === 0) {
            alert("Please select a rating.");
            return;
        }

        if (!category) {
            alert("Please select a category.");
            return;
        }

        const userId = localStorage.getItem("userId");
        if (!userId) {
            alert("You must be logged in to submit a review.");
            window.location.href = "/signin";
            return;
        }

        fetch("/api/reviews?userId=" + userId + "&gymId=" + gymId, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                rating: rating,
                comment: comment,
                category: category
            })
        })
        .then(res => {
            if (!res.ok) {
                return res.text().then(text => { throw new Error("Server " + res.status + ": " + text); });
            }
            return res.json();
        })
        .then(() => {
            document.getElementById('reviewForm').reset();
            selectedRating = 0;
            highlightStars(0);
            loadReviews();
        })
        .catch(err => {
            alert("Failed to submit review:\n" + err.message);
        });
    });

</script>

</body>
</html>