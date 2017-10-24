class Api::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def create
    review = Review.new(review_params)
    review.user = current_user

    if review.save
      render_reviews(review.truck)
    else
      render json: { error: review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    review = Review.update(params[:id], review_params)
    render_reviews(review.truck)
  end

  def destroy
    truck = Truck.find(params[:truck_id])
    Review.destroy(params[:id])
    render_reviews(truck)
  end

  def index
    truck = Truck.find(params[:truck_id])
    render_reviews(truck)
  end

  private
  def review_params()
    params.require(:review).permit(:truck_id, :rating, :description)
  end

  def render_reviews(truck)
    render json: { reviews: truck.reviews.order(created_at: :desc) }
  end
end
