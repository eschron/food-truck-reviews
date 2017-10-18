class ReviewsController < ApplicationController
  def new
    @truck = Truck.find(params[:truck_id])
    @review = @truck.reviews.new
  end

  def create
    @truck = Truck.find(params[:truck_id])
    @review = @truck.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review added successfully"
      redirect_to truck_path(params[:truck_id])
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
