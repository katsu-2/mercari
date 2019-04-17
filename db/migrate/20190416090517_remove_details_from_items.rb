class RemoveDetailsFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :size, :string
    remove_column :items, :condition, :string
    remove_column :items, :delivery_fee, :string
    remove_column :items, :delivery_date, :string
    remove_column :items, :delivery_way, :string
  end
end
