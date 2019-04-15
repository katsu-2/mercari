class Category < ApplicationRecord
  has_many :items
  has_many :brands
  has_many :brands, through: :brand_categories
end
