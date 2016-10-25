# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  text       :text(65535)
#  rating     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ApplicationRecord
  belongs_to :product

  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
