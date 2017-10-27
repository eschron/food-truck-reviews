class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:show]

  def show
    render json: { user: User.find(params[:id]) }
  end
end