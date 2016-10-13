class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :picture
      t.text :description
      t.float :price
      t.string :category

      t.timestamps
    end
  end
end
