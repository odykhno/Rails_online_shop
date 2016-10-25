ActiveAdmin.register Review do
  permit_params :text, :product_id, :rating

  index do
    selectable_column
    id_column
    column :text
    column :product_id
    column :rating
  end
end
