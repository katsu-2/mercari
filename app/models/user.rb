class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many    :items
  has_many    :profits
  has_many    :likes
  has_many    :comments
  # belongs_to  :cart


  validates :email, presence: true, uniqueness: true
end
