# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Category < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, :description, presence: true
end
