import React from 'react';
import Review from './Review'

const ReviewList = props => {
  let reviews = props.reviews.map (review => {
    return(
      <Review
        loadReviews={props.loadReviews}
        key={review.id}
        id={review.id}
        rating={review.rating}
        description={review.description}/>
    )
  })

  return(
    <div>
      <h4>Reviews</h4>
      {reviews}
    </div>
  )
}

export default ReviewList;
