class AddSizeToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :size, :string
    add_column :items, :condition, :string
    add_column :items, :delivery_fee, :integer
    add_column :items, :delivery_date, :integer
    add_column :items, :delivery_way, :integer
    add_column :items, :delivery_area, :integer
  end
end
