import React, { Component } from 'react';

class FormContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      errors: {},
      rating: null,
      description: ''
    }
    // this.handleClearForm = this.handleClearForm.bind(this);
    // this.handleFormSubmit = this.handleFormSubmit.bind(this);
    // this.handleRatingChange = this.handleRatingChange.bind(this);
    // this.handleDescriptionChange = this.handleDescriptionChange.bind(this);
    //
    // this.validateConsumedChange = this.validateConsumedChange.bind(this);
    // this.validateMealSelection = this.validateMealSelection.bind(this);
  }

  render() {
    return (
      <div>
        <p>heyyyy</p>
      </div>
    )
  }
}

export default FormContainer;
