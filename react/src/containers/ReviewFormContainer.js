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
    this.handleNew = this.handleNew.bind(this);
    this.handleRatingChange = this.handleRatingChange.bind(this);
    this.handleDescriptionChange = this.handleDescriptionChange.bind(this);
    this.handleUpdate = this.handleUpdate.bind(this);
    this.handleDelete = this.handleDelete.bind(this);
  }

  handleClearForm() {
    this.setState({
      ratingErrors: '',
      rating: null,
      description: ''
    })
  }

  handleNew(event){
    event.preventDefault();
    if (this.state.rating === null) {
      this.setState({ratingErrors: 'Please select a rating.'})
    }
    else {
      let formPayload = {
        rating: parseInt(this.state.rating, 10),
        description: this.state.description,
      }
      this.props.handleReviewRequest(formPayload, 'POST')
      this.handleClearForm()
    }
  }

  handleUpdate(event) {
    event.preventDefault();
    let formPayload = {
      rating: parseInt(this.state.rating, 10),
      description: this.state.description,
      reviewId: this.props.reviewId
    }
    this.props.handleReviewRequest(formPayload, 'PATCH')
  }

  handleDelete(event) {
    event.preventDefault();
    let formPayload = {
      reviewId: this.props.reviewId
    }
    this.props.handleReviewRequest(formPayload, 'DELETE')
  }

  handleRatingChange(value){
    this.setState({ratingErrors: '', rating: value})
  }

  handleDescriptionChange(event) {
    this.setState({description: event.target.value})
  }

  componentDidMount() {
    if (this.props.rating) {
      this.setState({rating: this.props.rating})
    }

    if (this.props.description) {
      this.setState({description: this.props.description})
    }
  }

  render() {
    let errorDiv;
    if (this.state.ratingErrors !== '') {
      errorDiv = <p>{this.state.ratingErrors}</p>
    }

    return (
      <div>
        {errorDiv}
        <ReviewForm
          handleClearForm = {this.handleClearForm}
          handleUpdate = {this.handleUpdate}
          handleNew = {this.handleNew}
          handleDelete = {this.handleDelete}
          handleRatingChange = {this.handleRatingChange}
          handleCancel = {this.handleCancel}
          rating = {this.state.rating}
          description = {this.state.description}
          handleDescriptionChange = {this.handleDescriptionChange}
          newOrUpdate = {this.props.newOrUpdate}
        />
      </div>
    )
  }
}

export default ReviewFormContainer;
