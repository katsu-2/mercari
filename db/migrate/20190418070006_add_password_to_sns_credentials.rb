class AddPasswordToSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    add_column :sns_credentials, :password, :string
  end
end
