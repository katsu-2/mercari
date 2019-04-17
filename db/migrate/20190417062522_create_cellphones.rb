class CreateCellphones < ActiveRecord::Migration[5.2]
  def change
    create_table :cellphones do |t|
      t.string :phone_num, null: false
      t.timestamps
    end
  end
end
