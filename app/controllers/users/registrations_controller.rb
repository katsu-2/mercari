class Users::RegistrationsController < Devise::RegistrationsController

  def create
    if params[:user][:email]

    password = Devise.friendly_token[0..8]
    params[:user][:password] = password

    end

    @sns_credential = SnsCredential.find(params[:id], session['devise.sns_id'])

    super

    @sns_credential.user_id = @user.id
    @sns_credential.save

  end

end

