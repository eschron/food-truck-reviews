import React, { Component } from 'react';
import ReviewFormContainer from '../containers/ReviewFormContainer';

export default class ReviewContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      vote_count: 0,
      user_id: null,
      user_admin: false,
      editReview: this.props.editReview,
      rating: this.props.rating,
      description: this.props.description,
      avatar: null,
      firstName: "",
      lastName: ""
    }

    this.vote = this.vote.bind(this)
    this.voteUp = this.voteUp.bind(this)
    this.voteDown = this.voteDown.bind(this)
    this.getVoteCount = this.getVoteCount.bind(this)
    this.showEditForm = this.showEditForm.bind(this)
    this.deleteReview = this.deleteReview.bind(this)
    this.getUser= this.getUser.bind(this)
  }

  vote(value) {
    fetch(`/api/reviews/${this.props.id}/votes`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'same-origin',
      body: JSON.stringify({
        up_down: value
      })
    })
      .then(response => {
        if (response.ok) {
          this.getVoteCount()
        }
      })
  }

  voteUp() {
    this.vote('UP')
  }

  voteDown() {
    this.vote('DOWN')
  }

  getVoteCount() {
    fetch(`/api/reviews/${this.props.id}/votes`)
    .then(res => {
      return res.json();
    })
    .then(votes => {
      let votes_array = votes.votes
      let total = 0
      total += votes_array.filter(vote => vote.up_down === true).length
      total -= votes_array.filter(vote => vote.up_down === false).length

      this.setState({
        vote_count: total
      })
    })
  }

  getUser() {
    let id = this.props.userID

    fetch(`/api/users/${id}`)
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
        avatar: body.user.avatar.url,
        firstName: body.user.first_name,
        lastName: body.user.last_name
      });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  showEditForm() {
    this.setState({ editReview: !this.state.editReview })
  }

  deleteReview() {
    fetch(`/api/reviews/${this.props.id}`, {
      method: 'DELETE',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'same-origin'
    })
    .then(res => {
      if (res.ok) {
        this.props.loadReviews()
      }
    })
  }

  componentWillReceiveProps(props) {
    this.setState({ editReview: this.props.editReview })
  }

  componentDidMount() {
    this.getVoteCount()
    let user_attributes = document.getElementById('truck-reviews-app')
    let id = (user_attributes !== null) ? user_attributes.dataset.currentuserid : null
    let admin = (user_attributes !== null) ? user_attributes.dataset.currentuseradmin : null
    admin = admin === 'true'
    this.setState({
      user_id: id,
      user_admin: admin
    })
    this.getUser()
  }

  render() {
    const admin_delete_button = (this.state.user_admin)
        ? ( <button className="admin-delete" onClick={this.deleteReview}>Delete</button> )
        : null

    let buttonDiv;
    if (this.props.userID == this.props.currentUserID) {
      let buttonValue = "Edit Review"
      if (this.state.editReview == true) {
        buttonValue = "Cancel Edits"
      }
      buttonDiv = <input
        type='button'
        className="edit-review-button"
        value = {buttonValue}
        onClick = {this.showEditForm}
      />
    }

    let reviewDiv;
    if (this.state.editReview) {
      reviewDiv = <ReviewFormContainer
        rating = {this.props.rating.toString()}
        description = {this.props.description}
        newOrUpdate = {"update"}
        handleReviewRequest = {this.props.handleReviewRequest}
        reviewId = {this.props.id}
      />
    } else {
      reviewDiv =
        <div className="review-content">
          <div className="review-prof-pic">
            <div className="img-container">
              <img src={this.state.avatar} alt="Profile Image"/>            
            </div>
            <div className="user-name">
              {`${this.state.firstName} ${this.state.lastName}`}
            </div>            
          </div>
          <div className="review-body">
            <div className="review-rating">Rating: {this.props.rating}</div>
            <div className="review-description">Description: {this.props.description}</div>
          </div>
          <div className="review-votes">
            <div className="review-vote-count">
              Votes: {this.state.vote_count}
            </div>
            <div className="up">
              <i className="material-icons" onClick={this.voteUp}>keyboard_arrow_up</i>
            </div>
            <div className="down">
              <i className="material-icons" onClick={this.voteDown}>keyboard_arrow_down</i>
            </div>
          </div>
            {admin_delete_button}
        </div>
    }
    return(
      <div className="review-container">
        {reviewDiv}
        {buttonDiv}
      </div>
    )
  }
}
