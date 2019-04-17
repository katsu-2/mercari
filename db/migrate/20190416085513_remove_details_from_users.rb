class RemoveDetailsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :post_num, :integer
    remove_column :users, :prefecture, :integer
    remove_column :users, :city, :string
    remove_column :users, :block_num, :string
    remove_column :users, :building_name, :string
  end
end
