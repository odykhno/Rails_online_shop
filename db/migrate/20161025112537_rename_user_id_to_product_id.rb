class RenameUserIdToProductId < ActiveRecord::Migration[5.0]
  def change
    change_table :reviews do |t|
      t.rename :user_id, :product_id
    end
  end
end
