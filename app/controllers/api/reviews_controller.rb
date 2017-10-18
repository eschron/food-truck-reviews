class Api::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    binding.pry
    review = Review.new(rating: params[:rating], description: params[:description])
  end
end
