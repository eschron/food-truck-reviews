import React, { Component } from 'react';

export default class Review extends Component {
  constructor(props) {
    super(props)
    this.state = {
      vote_count: 0
    }

    this.vote = this.vote.bind(this)
    this.voteUp = this.voteUp.bind(this)
    this.voteDown = this.voteDown.bind(this)
    this.getVoteCount = this.getVoteCount.bind(this)
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

  componentDidMount() {
    this.getVoteCount()
  }

  render() {
    let buttonDiv;
    if (this.props.userID == this.props.currentUserID) {
      buttonDiv = <input type='button' value = "Edit Review" />
    }
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

        </ul>

        {buttonDiv}
        <br/>---<br/>
      </div>
    )
  }
}
