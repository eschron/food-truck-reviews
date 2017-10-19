import React from 'react';

const Reviews = props => {
  let reviews = props.reviews.map (review => {
    return(
      <div key={review.id}>
        <ul>
          <li>Rating: {review.rating}</li>
          <li>Description: {review.description}</li>
        </ul>
      </div>
    )
  })

  return(
    <div>
      <h4>Reviews</h4>
      {reviews}
    </div>
  )
}

export default Reviews;
