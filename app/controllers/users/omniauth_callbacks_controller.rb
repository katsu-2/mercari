class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google
    callback_for(:google)
  end




  private

  def callback_for(provider)
    sns_info = SnsCredential.find_oauth(request.env['omniauth.auth'])
    @user = sns_info[:user]
    sns_id = sns_info[:sns_id]
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.sns_id'] = sns_id
      render template: "devise/registrations/new"
    end
  end

end
