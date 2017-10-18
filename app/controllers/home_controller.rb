class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to trucks_path
    else
      @user = User.new
    end
  end
end
