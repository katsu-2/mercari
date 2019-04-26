class SnsCredential < ApplicationRecord

 belongs_to  :user, optional: true

  def self.find_oauth(auth)
    # binding.pry
    sns = SnsCredential.where(uid: auth.uid, provider: auth.provider).first_or_create
    # binding.pry
    if  sns.user
      user = sns.user
    else
      user = sns.build_user(
         nickname: auth.info.name,
         email: auth.info.email
        )
    end
    sns_info = {user: user, sns_id: sns.id}

  end


end


