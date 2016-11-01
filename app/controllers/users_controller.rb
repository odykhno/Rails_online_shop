class UsersController < ApplicationController
  def show_cart
    @cart = []
    arr = current_user.cart.split(',')
    arr.each do |id|
      @cart << Product.find_by(id: id)
    end
    prices = @cart.map { |product| product.price }
    @total = prices.inject(0){ |result, elem| result + elem }
  end

  def delete_from_cart
    @product = params[:format]
    cart = current_user.cart.split(',')
    cart.delete_if {|id| id == @product }
    current_user.cart = cart.join(',')
    current_user.save
    redirect_to :back
  end
end