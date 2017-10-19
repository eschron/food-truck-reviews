import React, { Component } from 'react';
import ReviewFormContainer from './ReviewFormContainer';

class ReviewSubmissionContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      review: {},
      addReview: false
    }
    this.handleNewReview= this.handleNewReview.bind(this);
    this.handleClick= this.handleClick.bind(this);
  }

  handleNewReview(submission) {
    this.setState({review: submission})
    let id = this.props.params.id
    let newReview = {truck_id: id,
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
        <button onClick={this.handleClick}>Add a review</button>
        <div className="small-9 small-centered columns">
          <h1 className="text-center"></h1>
          {formDiv}
        </div>
      </div>
    )
  }
}

export default ReviewSubmissionContainer;
