class RemoveEmailFromSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    remove_column :sns_credentials, :email, :string
  end
end
