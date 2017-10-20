import React, { Component } from 'react';
import ReviewForm from '../components/ReviewForm'

class ReviewFormContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      ratingErrors: '',
      rating: null,
      description: ''
    }
    this.handleClearForm = this.handleClearForm.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleRatingChange = this.handleRatingChange.bind(this);
    this.handleDescriptionChange = this.handleDescriptionChange.bind(this);
  }

  handleClearForm() {
    this.setState({
      ratingErrors: '',
      rating: null,
      description: ''
    })
  }

  handleSubmit(event){
    event.preventDefault();
    if (this.state.rating == null) {
      this.setState({ratingErrors: 'Please select a rating.'})
    }
    else {
      let formPayload = {
        rating: parseInt(this.state.rating, 10),
        description: this.state.description
      }
      this.props.handleNewReview(formPayload)
      this.handleClearForm()
    }
  }

  handleRatingChange(value){
    this.setState({ratingErrors: '', rating: value})
  }

  handleDescriptionChange(event) {
    this.setState({description: event.target.value})
  }

  render() {
    let errorDiv;
    if (this.state.ratingErrors != '') {
      errorDiv = <p>{this.state.ratingErrors}</p>
    }
    return (
      <div>
        {errorDiv}
        <ReviewForm
          handleClearForm = {this.handleClearForm}
          handleSubmit = {this.handleSubmit}
          handleRatingChange = {this.handleRatingChange}
          rating = {this.state.rating}
          description = {this.state.description}
          handleDescriptionChange = {this.handleDescriptionChange}
        />
      </div>
    )
  }
}

export default ReviewFormContainer;
