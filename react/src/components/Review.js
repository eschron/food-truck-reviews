import React, { Component } from 'react';

export default class Review extends Component {
  constructor(props) {
    super(props)
    this.state = {
      vote_count: 0,
      user_id: null
    }

    this.vote = this.vote.bind(this)
    this.voteUp = this.voteUp.bind(this)
    this.voteDown = this.voteDown.bind(this)
    this.getVoteCount = this.getVoteCount.bind(this)
    this.deleteReview = this.deleteReview.bind(this)
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

  componentDidMount() {
    this.getVoteCount()
    let id = document.getElementById('app').dataset.currentUserID
    this.setState({
      user_id: id
    })
  }

  render() {
    return(
      <div>
        <ul>
          <li>
            Votes: {this.state.vote_count}
          </li>
          <li>
            <button onClick={this.voteUp}>UP</button>
          </li>
          <li>
            <button onClick={this.voteDown}>DOWN</button>
          </li>
          <li>Rating: {this.props.rating}</li>
          <li>Description: {this.props.description}</li>
          <button onClick={this.deleteReview}>Delete</button>
        </ul>
      </div>
    )
  }
}
