class Users::SessionsController < Devise::SessionsController

  def create
    redirect_to root_path if user_signed_in?
  end
end
