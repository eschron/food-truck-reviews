class TrucksController < ApplicationController
  before_action :authenticate_user!

  def index
    @trucks = Truck.all
  end

  # GET /trucks/1
  def show
    @truck = Truck.find(params[:id])
    @reviews = @truck.reviews
  end
end
