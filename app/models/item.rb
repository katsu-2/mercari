class Item < ApplicationRecord
  has_many   :comments
  has_many   :brands
  has_many   :images
  has_many   :profits
  has_many   :likes
  belongs_to :user
  belongs_to :category
  belongs_to :cart
end
