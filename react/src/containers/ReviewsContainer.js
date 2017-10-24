import React, { Component } from 'react';
import ReviewFormContainer from './ReviewFormContainer';
import ReviewList from '../components/ReviewList';

class ReviewsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      allReviews: [],
      addReview: false,
      editReview: false,
      currentUserID: null
    }
    this.handleReviewRequest = this.handleReviewRequest.bind(this);
    this.handleAddReviewClick = this.handleAddReviewClick.bind(this);
    this.getReviews = this.getReviews.bind(this);
    this.handleCancel = this.handleCancel.bind(this);
  }

  getReviews() {
    let id = document.getElementById('app').dataset.currentuserid;
    id = parseInt(id, 10)

    fetch(`/api/trucks/${this.props.params.id}/reviews.json`)
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
            error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      this.setState({
        allReviews: body.reviews,
        currentUserID: id
      });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    this.getReviews()
  }

  handleReviewRequest(submission, method) {
    let truckId = this.props.params.id
    let newReview = {truck_id: truckId}
    if (submission.rating) {
      newReview = Object.assign(newReview, {
        rating: submission.rating,
        description: submission.description
      })
    }

    let fetchURL = '/api/reviews';
    if (submission.reviewId) {
      fetchURL = `/api/reviews/${submission.reviewId}`
    }
    fetch(fetchURL, {
      credentials: 'same-origin',
      method: method,
      body: JSON.stringify(newReview),
      headers: { 'Content-Type': 'application/json' }
    })
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
              error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({
          allReviews: body.reviews,
          addReview: false,
          editReview: false
        });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleAddReviewClick() {
    this.setState({addReview: true})
  }

  handleCancel() {
    this.setState({addReview: false})
  }

  render() {
    let formDiv;
    if (this.state.addReview) {
      formDiv = <ReviewFormContainer
        handleReviewRequest={this.handleReviewRequest}
        handleDelete={this.handleDelete}
        newOrUpdate={"new"}
        handleCancel={this.handleCancel}
      />
    }

    return (
      <div className="row">
        <input type="button" value="Add a review" onClick={this.handleAddReviewClick} />
        <div className="small-9 small-centered columns">
          <h1 className="text-center"></h1>
          {formDiv}
        </div>
        <ReviewList
          handleReviewRequest = {this.handleReviewRequest}
          currentUserID = {this.state.currentUserID}
          reviews = {this.state.allReviews}
          editReview = {this.state.editReview}
          loadReviews={this.getReviews}
        />
      </div>
    )
  }
}

export default ReviewsContainer;
