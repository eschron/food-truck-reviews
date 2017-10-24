import React from 'react';
import ReviewContainer from '../containers/ReviewContainer'

const ReviewList = props => {
  let reviews = props.reviews.map (review => {
    return(
      <ReviewContainer
        currentUserID = {props.currentUserID}
        userID = {review.user_id}
        loadReviews={props.loadReviews}
        key={review.id}
        id={review.id}
        rating={review.rating}
        description={review.description}
        handleReviewRequest={props.handleReviewRequest}
        editReview={props.editReview}
      />
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
