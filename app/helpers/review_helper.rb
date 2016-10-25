module ReviewHelper
  def average_rating(product)
    sum = 0
    product.reviews.each do |review|
      sum += review.rating
    end
    average_rating = sum/product.reviews.count
  end
end
