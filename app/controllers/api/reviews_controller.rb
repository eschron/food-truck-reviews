class Api::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def create
    @review = Review.new(
      truck_id: params[:truck_id],
      user: current_user,
      rating: params[:rating],
      description: params[:description]
    )
    if @review.save
      ReviewMailer.new_review(@review).deliver_now
      render_reviews(@review.truck)
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
    @truck = Truck.find(params[:truck_id])
    render_reviews(@truck)
  end

  def show
    render json: { review: Review.find(params[:id])}
  end

  def destroy
    if current_user.admin == true
      review = Review.find(params[:id])
      truck = review.truck
      Review.delete(review)
      render_reviews(truck)
    else
      redirect_to review.truck
    end
  end

  private
  def render_reviews(truck)
    render json: { reviews: truck.reviews.order(created_at: :desc) }
  end
end
