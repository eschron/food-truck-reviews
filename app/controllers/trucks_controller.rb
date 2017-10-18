class TrucksController < ApplicationController
  before_action :authenticate_user!

  def index
    @trucks = Truck.all
  end

  def show
    @truck = Truck.find(params[:id])
    @reviews = @truck.reviews
  end

  def new
    @truck = Truck.new
  end

  def create
    @truck = Truck.new(truck_params)
    @truck.location = Location.find(params[:location])

    if @truck.save
      flash[:notice] = "Truck added successfully"
      redirect_to truck_path(@truck)
    else
      render :new
    end
  end

  def edit
    @truck = Truck.find(params[:id])
  end

  def update
    @truck = Truck.find(params[:id])
    @truck.update(truck_params)
    @truck.location = Location.find(params[:location])

    if @truck.save
      flash[:notice] = "Truck updated successfully"
      redirect_to truck_path(@truck)
    else
      render :new
    end
  end

  def destroy
    @truck = Truck.find(params[:id])

    if Truck.destroy(@truck.id)
      flash[:notice] = "Food Truck successfully deleted"
      redirect_to trucks_path
    else
      render truck_path(@truck)
    end
  end

  private
  def truck_params
    params.require(:truck).permit(:name, :description, :email, :location)
  end
end
