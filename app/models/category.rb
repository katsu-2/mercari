class Category < ApplicationRecord
  has_many :items
  has_many :brand_categories
  has_many :brands, through: :brand_categories

  belongs_to :parent, class_name: :Category
  has_many :children, class_name: :Category, foreign_key: :parent_id
end
