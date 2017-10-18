import React, { Component } from 'react';
import ReviewForm from '../components/ReviewForm'

class ReviewFormContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      errors: {},
      rating: null,
      description: ''
    }
    this.handleClearForm = this.handleClearForm.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleRatingChange = this.handleRatingChange.bind(this);
    this.handleDescriptionChange = this.handleDescriptionChange.bind(this);

    // this.validateConsumedChange = this.validateConsumedChange.bind(this);
    // this.validateMealSelection = this.validateMealSelection.bind(this);
  }

  handleClearForm() {
    this.setState({
      errors: {},
      rating: null,
      description: ''
    })
  }

  handleSubmit(event){
    event.preventDefault();
    let formPayload = {
      rating: parseInt(this.state.rating, 10),
      description: this.state.description
    }
    this.props.handleNewReview(formPayload)
    this.handleClearForm()
    console.log(this.state.rating)
  }

  handleRatingChange(value){
    this.setState({rating: value})
  }

  handleDescriptionChange(event) {
    this.setState({description: event.target.value})
  }

  render() {
    let errorDiv;

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
