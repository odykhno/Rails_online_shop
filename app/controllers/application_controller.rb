class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def find_approved_reviews(product)
    @reviews = product.reviews.where(approved: true)
  end
end
