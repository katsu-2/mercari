class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :full_name, null: false
      t.string :full_kana, null: false
      t.string :post_num, null: false
      t.string :city, null: false
      t.string :block_num, null: false
      t.string :building_name
      t.timestamps
    end
  end
end
