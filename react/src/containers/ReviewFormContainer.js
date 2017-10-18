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
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.handleRatingChange = this.handleRatingChange.bind(this);
    // this.handleDescriptionChange = this.handleDescriptionChange.bind(this);
    //
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
      rating: this.state.rating,
      description: this.state.description
    }
    this.props.handleNewReview(formPayload)
    this.handleClearForm()
  }

  handleRatingChange(event){
    this.setState({rating: event.target.value})
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
        />
      </div>
    )
  }
}

export default ReviewFormContainer;
