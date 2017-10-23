class Api::VotesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    review_id = params[:review_id]
    value = params[:up_down]
    if value == 'UP'
      value = true
    else
      value = false
    end

    vote_matches = Vote.where(user: current_user, review_id: review_id)

    if vote_matches.length == 1
      vote = vote_matches[0]
      if vote.up_down == value
        Vote.delete(vote)
      else
        Vote.update(vote.id, up_down: value)
      end
    else
      Vote.create!(
        user: current_user,
        review_id: review_id,
        up_down: value
      )
    end
  end

  def index
    review = Review.find(params[:review_id])
    render json: { votes: review.votes }
  end
end
