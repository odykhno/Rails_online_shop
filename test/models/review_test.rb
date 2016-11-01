# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  text       :text(65535)
#  rating     :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  approved   :boolean          default(FALSE)
#

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
