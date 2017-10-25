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
    review = Review.find(params[:id])
    if review.user == current_user
      review.update(review_params)
    end
    render_reviews(review.truck)
  end

  def destroy
    review = Review.find(params[:id])
    truck = review.truck
    if review.user == current_user || current_user.admin?
      Review.destroy(review.id)
      render_reviews(truck)
    else
      redirect_to review.truck
    end
  end

  def index
    @truck = Truck.find(params[:truck_id])
    render_reviews(@truck)
  end

  def show
    render json: { review: Review.find(params[:id])}
  end

  private
  def render_reviews(truck)
    render json: { reviews: truck.reviews.order(created_at: :desc) }
  end

  def review_params()
   params.require(:review).permit(:truck_id, :rating, :description)
 end
end
