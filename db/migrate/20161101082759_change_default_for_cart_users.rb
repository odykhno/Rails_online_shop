class ChangeDefaultForCartUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :cart, :string, default: ''
  end
end
