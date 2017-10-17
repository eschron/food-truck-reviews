class TrucksController < ApplicationController
  before_action :authenticate_user!

  def index
    @trucks = Truck.all
  end
end
