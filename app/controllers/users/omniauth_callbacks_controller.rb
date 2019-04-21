class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google
    callback_for(:google)
  end




  private

  def callback_for(provider)

      sns_info = User.find_oauth(request.env['omniauth.auth'])
      @user = sns_info(:user)

      if @user.persisted?
        sign_in_and_redirect @user
      else
        session['devise.user_attributes'] = request.env["omniauth.auth"]
        render template: "device/registration/new"
        # redirect_to new_user_registration_url
      end
    end

   def failure
    redirect_to root_path
  end
end
