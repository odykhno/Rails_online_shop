class AddRatingToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :rating, :integer, default: 0
  end
end
