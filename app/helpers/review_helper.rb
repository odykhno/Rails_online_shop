module ReviewHelper
  def average_rating(product)
    sum = 0
    product.reviews.each do |review|
      sum += review.rating
    end
    product.reviews.count == 0 ? 0 : sum/product.reviews.count
  end
end
