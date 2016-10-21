class RemovePictureFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :picture, :text
  end
end
