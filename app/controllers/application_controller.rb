class ApplicationController < ActionController::Base
  helper_method :create_order_list
  protect_from_forgery with: :exception

  private
  def find_approved_reviews(product)
    @reviews = product.reviews.where(approved: true)
  end

  def create_order_list(user)
    @cart = []
    arr = user.cart.split(',')
    arr.each do |id|
      @cart << Product.find_by(id: id)
    end
    @orders = []
    @cart.each do |product|
      @orders << product.name
    end
    @orders = @orders.join(', ')
  end
end
