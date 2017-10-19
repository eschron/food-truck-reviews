class Api::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    review = Review.create(
      truck_id: params[:truck_id],
      user: current_user,
      rating: params[:rating],
      description: params[:description]
    )
  end
end
