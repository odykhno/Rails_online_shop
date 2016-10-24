# == Schema Information
#
# Table name: products
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  description          :text(65535)
#  price                :float(24)
#  category             :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

class Product < ApplicationRecord
  # belongs_to :category

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

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
