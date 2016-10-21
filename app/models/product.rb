# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  picture     :text(65535)
#  description :text(65535)
#  price       :float(24)
#  category    :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  # belongs_to :category

  ActiveAdmin.register Product do
    permit_params :name, :description, :picture, :price, :category
  end

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
