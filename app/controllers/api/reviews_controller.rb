class Api::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    review = Review.new(
      truck_id: params[:truck_id],
      user: current_user,
      rating: params[:rating],
      description: params[:description]
    )

    if review.save
      render json: { reviews: Review.all }
    else
      render json: { error: review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    render json: { reviews: Review.all }
  end
end
