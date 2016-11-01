class UsersController < ApplicationController
  def show_cart
    @cart = []
    arr = current_user.cart.split(',')
    arr.each do |id|
      @cart << Product.find_by(id: id)
    end
  end
end