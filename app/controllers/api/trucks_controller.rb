class Api::TrucksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def show
    render json: { truck: Truck.find(params[:id]) }
  end

  def index
    render json: "Hi"
    render json: { trucks: Truck.all }
  end
end
