class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google, :facebook]


  has_many    :items
  has_many    :profits
  has_many    :likes
  has_many    :comments
  has_many    :sns_credentials
  # belongs_to  :cart


  validates :email,       presence: true, uniqueness: true
  validates :family_name, presence: true, on: :update


# uid: auth.uid, provider: auth.provider

def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        # user = User.create(
        #   nickname: auth.info.name,
        #   email:    auth.info.email,
        #   password: Devise.friendly_token[0, 20],
        #   )
        user = SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end
end






# @auth = SnsCredential.new(uid: auth.uid, provider: auth.provider, email: auth.info.email)
#                   # @auth.save
#                     # binding.pry

# snscredential = SnsCredential.where(uid: auth.uid, provider: auth.provider).first
#     if snscredential.present?
#       user = User.where(id: snscredential.user_id).first
#     else

#       user = User.where(email: auth.info.email).first
#       if user.present?
#         SnsCredential.create(
#           uid: auth.uid,
#           provider: auth.provider,
#           user_id: user.id
#           )

#       end
#       user

#     end
#   end



# end


# private
    #   def auth_params
    #   params.permit(:uid, :probvider)
