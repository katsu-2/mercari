class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:google, :facebook]

  
  has_many    :sns_credentials
  # belongs_to  :cart

  has_many  :items
  has_many  :profits
  has_many  :likes
  has_many  :comments
  has_many  :carts
  has_many  :credits


  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_kana, presence: true
  validates :first_kana, presence: true
end

