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

  def index
    if current_user.admin == true
      @users = User.all
    else
      redirect_to trucks_path
    end
  end

  def destroy
    if current_user.admin == true
      @user = User.find(params[:id])

      if User.destroy(@user.id)
        Review.where(user_id: params[:id]).destroy_all
        flash[:notice] = "User successfully deleted"
        redirect_to users_path
      else
        render users_path
      end
    else
      redirect_to trucks_path
    end
  end
end
