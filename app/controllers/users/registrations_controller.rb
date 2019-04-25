class Users::RegistrationsController < Devise::RegistrationsController


  def create
      if params[:user][:email]


    password = Devise.friendly_token[0..8]
    params[:user][:password] = password

    end


    super

    @sns_credential_user_id = session['devise.sns_id']
    binding.pry
    @sns_credential.save
    #
    # @sns_credential.user_id = User.
    # @sns_credential.save



  end


  # private

  # def user_params
  # params.require(:user).permit(:family_name, :first_name, :family_kana, :first_kana).merge(email: @user.email, nickname: @user.nickname)
  # end
end

