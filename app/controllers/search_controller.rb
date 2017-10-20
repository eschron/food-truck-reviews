class SearchController < ApplicationController
  def index
    @locations = Location.all
    @categories = Category.all
    if params[:search] == nil && params[:location_id] == nil && params[:category] == nil
      @trucks = Truck.all
    elsif params[:search] != "" && params[:location_id] != "" && params[:category] != nil
      like_keyword = "%#{params[:search]}%"
      trucks1 = Truck.where("lower(name) LIKE ?", like_keyword.downcase).where(location_id: params[:location_id])
      @trucks = trucks1.joins(categorizations: :category).where(categories: {cuisine: params[:category]})
    elsif params[:search] != "" && params[:location_id] != ""
      like_keyword = "%#{params[:search]}%"
      @trucks = Truck.where("lower(name) LIKE ?", like_keyword.downcase).where(location_id: params[:location_id])
    elsif params[:location_id] != "" && params[:category] != nil
      trucks1 = Truck.where(location_id: params[:location_id])
      @trucks = trucks1.joins(categorizations: :category).where(categories: {cuisine: params[:category]})
    elsif params[:search] != "" && params[:category] != nil
      like_keyword = "%#{params[:search]}%"
      trucks1 = Truck.where("lower(name) LIKE ?", like_keyword.downcase)
      @trucks = trucks1.joins(categorizations: :category).where(categories: {cuisine: params[:category]})
    elsif params[:search] != ""
      like_keyword = "%#{params[:search]}%"
      @trucks = Truck.where("lower(name) LIKE ?", like_keyword.downcase)
    elsif params[:location_id] != ""
      @trucks = Truck.where(location_id: params[:location_id])
    elsif params[:category]
      @trucks = Truck.joins(categorizations: :category).where(categories: {cuisine: params[:category]})
    else
      @trucks = Truck.all
    end
  end

  def form_params
    params.require(:truck).permit(:search)
  end
end
