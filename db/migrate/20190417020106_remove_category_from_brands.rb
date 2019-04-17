class RemoveCategoryFromBrands < ActiveRecord::Migration[5.2]
  def remove
    remove_column :brands, :categories
  end
end
