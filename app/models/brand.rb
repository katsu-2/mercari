class Brand < ApplicationRecord
  # belongs_to :category
  has_many   :brand_categories
  has_many   :categories, through: :brand_categories
end
