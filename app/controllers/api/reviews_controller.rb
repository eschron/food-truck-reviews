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
      render_reviews(review.truck)
    else
      render json: { error: review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    truck = Truck.find(params[:truck_id])
    render_reviews(truck)
  end

  private
  def render_reviews(truck)
    render json: { reviews: truck.reviews.order(created_at: :desc) }
  end
end
