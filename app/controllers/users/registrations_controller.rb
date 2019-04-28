class Users::RegistrationsController < Devise::RegistrationsController

  def create
    if session['devise.sns_id']

    password = Devise.friendly_token[0..8]
    params[:user][:password] = password

    @sns_credential = SnsCredential.find(params[:id], session['devise.sns_id'])

    end

    super

    if @sns_credential
    @sns_credential.user_id = @user.id
    @sns_credential.save

    end
  end

end


