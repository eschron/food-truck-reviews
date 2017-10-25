class TrucksController < ApplicationController
  before_action :authenticate_user!

  def index
    @trucks = Truck.all
  end

  def show
    @truck = Truck.find(params[:id])
  end

  def new
    if current_user.admin? || current_user.truck_owner?
      @truck = Truck.new
    else
      flash[:notice] = "You are not authorized to add a truck."
      redirect_to trucks_path
    end
  end

  def create
    if current_user.admin? || current_user.truck_owner?
      @truck = Truck.new(
        name: truck_params[:name],
        location: Location.find(truck_params[:location_id]),
        description: truck_params[:description]
      )

      @truck.user = current_user

      if @truck.save
        flash[:notice] = "Truck added successfully"
        redirect_to truck_path(@truck)
      else
        flash[:notice] = "Unable to add truck"
        render :new
      end
    else
      flash[:notice] = "You are not authorized to add a truck."
      redirect_to trucks_path
    end
  end

  def edit
    @truck = Truck.find(params[:id])

    if !(@truck.user == current_user || current_user.admin?)
      flash[:notice] = "You are not authorized to update this truck's info."
      redirect_to truck_path(@truck)
    end

  end

  def update
    @truck = Truck.find(params[:id])

    if @truck.user == current_user || current_user.admin?
      @truck.update(truck_params)
      @truck.location = Location.find(params[:location])

      if @truck.save
        flash[:notice] = "Truck updated successfully"
        redirect_to truck_path(@truck)
      else
        render :edit
      end

    else
      flash[:notice] = "You are not authorized to update this truck's info."
      redirect_to truck_path(@truck)
    end
  end

  def destroy
    @truck = Truck.find(params[:id])

    if @truck.user == current_user || current_user.admin?
      if Truck.destroy(@truck.id)
        Review.where(truck_id: params[:id]).destroy_all
        flash[:notice] = "Food Truck successfully deleted"
        redirect_to trucks_path
      else
        render truck_path(@truck)
      end
    end
  end

  def search
    @locations = Location.all
    @categories = Category.all
    @like_keyword = "%#{params[:search]}%"
    if !category_params && !search_params && !location_params
      @trucks = Truck.all
    elsif search_params && location_params && category_params
      trucks1 = find_trucks_matching_name_and_location(@like_keyword)
      @trucks = filter_trucks_by_category(trucks1)
    elsif search_params && location_params
      @trucks = find_trucks_matching_name_and_location(@like_keyword)
    elsif location_params && category_params
      trucks1 = find_trucks_matching_location
      @trucks = filter_trucks_by_category(trucks1)
    elsif search_params && category_params
      trucks1 = find_trucks_matching_name(@like_keyword)
      @trucks = filter_trucks_by_category(trucks1)
    elsif search_params
      @trucks = find_trucks_matching_name(@like_keyword)
    elsif location_params
      @trucks = find_trucks_matching_location
    elsif category_params
      @trucks = find_trucks_matching_category
    else
      @trucks = Truck.all
    end
  end

  private
  def truck_params
    params.require(:truck).permit(:name, :description, :user, :location_id)
  end

  def find_trucks_matching_category
    Truck.joins(categorizations: :category).where(categories: {cuisine: params[:category]})
  end

  def find_trucks_matching_name(query)
    Truck.where("lower(name) LIKE ?", @like_keyword.downcase)
  end

  def find_trucks_matching_location
    Truck.where(location_id: params[:location_id])
  end

  def filter_trucks_by_category(trucks)
    trucks.joins(categorizations: :category).where(categories: {cuisine: params[:category]})
  end

  def find_trucks_matching_name_and_location(query)
    Truck.where("lower(name) LIKE ?", query.downcase).where(location_id: params[:location_id])
  end

  def form_params
    params.require(:truck).permit(:search)
  end

  def location_params
    (params[:location_id] != nil) && (params[:location_id] != "")
  end

  def search_params
    (params[:search] != nil) && (params[:search] != "")
  end

  def category_params
    (params[:category] != nil) && (params[:category] != "")
  end
end
