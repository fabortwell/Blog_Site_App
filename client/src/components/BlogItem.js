import StarRating from "../rating/Rating"

function BlogItem({ post, onUpdatePost, onDeletePost }) {
  const { id, image_url, title, description, notes, rating } = post;

  function handleUpdateRating(pct) {
    const newRating = pct * 5;
    fetch(`/posts/${id}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ rating: newRating }),
    })
      .then((r) => r.json())
      .then(onUpdatePost);
  }

  function handleDeletePost() {
    fetch(`/posts/${id}`, {
      method: "DELETE",
    }).then((r) => {
      if (r.ok) {
        onDeletePost(post);
      }
    });
  }

  return (
    <div className="spice-item card">
      <img src={image_url} alt={title} />
      <div className="details">
        <h2>{title}</h2>
        <p>{description}</p>
        <p>
          Tasting Notes: <em>{notes}</em>
        </p>
        <div>
          Rating:{" "}
          <StarRating percentage={rating / 5} onClick={handleUpdateRating} />
        </div>
        <p>
          <button onClick={handleDeletePost}>Delete Spice</button>
        </p>
      </div>
    </div>
  );
}

export default BlogItem;
