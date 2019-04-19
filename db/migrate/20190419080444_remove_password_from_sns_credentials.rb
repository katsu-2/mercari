class RemovePasswordFromSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    remove_column :sns_credentials, :password, :string
  end
end
