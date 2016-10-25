ActiveAdmin.register Product do
  permit_params :name, :description, :picture, :price, :category

  form do |f|
    f.inputs 'Products' do
      f.input :category, as: :select, collection: Category.pluck(:name)
      f.input :name
      f.input :description
      f.input :price
      f.input :picture, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :category
      row :id
      row :name
      row :description
      row :price
      row :picture do |product|
        image_tag product.picture.url, size: '150x150'
      end
    end
    active_admin_comments
  end

  index do
    selectable_column
    id_column
    column :category
    column :name
    column :description
    column :price
    column :picture do |product|
      image_tag product.picture.url, size: '50x50'
    end
  end
end
