class ChangeDatatypeSizeOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :size, :integer
    change_column :items, :condition, :integer
  end
end
