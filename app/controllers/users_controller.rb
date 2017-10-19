class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user == User.find(params[:id])
      @user = User.find(params[:id])
    else
      redirect_to trucks_path
      flash[:notice] = "You are not authorized to access that page."
    end
  end
end
