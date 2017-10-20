import React, { Component } from 'react';
import ReviewFormContainer from './ReviewFormContainer';
import Reviews from '../components/Reviews';

class ReviewsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      allReviews: [],
      review: {},
      addReview: false
    }
    this.handleNewReview = this.handleNewReview.bind(this);
    this.handleClick = this.handleClick.bind(this);
    this.getReviews = this.getReviews.bind(this);
  }

  getReviews() {
    let that = this;
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
        that.setState({ allReviews: body.reviews });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    this.getReviews()
  }

  handleNewReview(submission) {
    this.setState({review: submission})
    let id = this.props.params.id
    let newReview = {
      truck_id: id,
      rating: submission.rating,
      description: submission.description
    }
    fetch('/api/reviews', {
      credentials: 'same-origin',
      method: 'POST',
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
          review: {},
          addReview: false
        });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleClick() {
    this.setState({addReview: true})
  }

  render() {
    console.log(this.state.review)
    let formDiv;
    if (this.state.addReview) {
      formDiv = <ReviewFormContainer handleNewReview={this.handleNewReview} />
    }
    return (
      <div className="row">
        <input type="button" value="Add a review" onClick={this.handleClick} />
        <div className="small-9 small-centered columns">
          <h1 className="text-center"></h1>
          {formDiv}
        </div>
        <Reviews reviews = {this.state.allReviews} />
      </div>
    )
  }
}

export default ReviewsContainer;
