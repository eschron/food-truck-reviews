class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(user)
    trucks_path
  end

  def after_update_path_for(user)
    user_path(user)
  end


end
