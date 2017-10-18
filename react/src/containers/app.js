import React, { Component } from 'react';
import ReviewFormContainer from './ReviewFormContainer';

class App extends Component {
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

export default App;
