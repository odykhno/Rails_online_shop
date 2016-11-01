class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.text :orders_list
      t.integer :user_id
      t.string :email
      t.integer :phone_number
    end
  end
end
