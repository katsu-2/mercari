class AddColumnsToSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    add_column :sns_credentials, :uid, :string
    add_column :sns_credentials, :provider, :string
  end
end
