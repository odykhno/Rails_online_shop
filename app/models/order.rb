# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  orders_list  :text(65535)
#  user_id      :integer
#  email        :string(255)
#  phone_number :integer
#

class Order < ApplicationRecord
  belongs_to :user

  # validates :email, :phone_number, presence: true
end
