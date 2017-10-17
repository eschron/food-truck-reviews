class TrucksController < ApplicationController
  before_action :authenticate_user!

  def index
    @trucks = Truck.all
  end

  def show
    @truck = Truck.find(params[:id])
    @reviews = @truck.reviews
  end
end
