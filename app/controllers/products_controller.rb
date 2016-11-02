class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @reviews = find_approved_reviews(@product)
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if current_user.cart == ''
      current_user.cart += @product.id.to_s
    else
      current_user.cart += ','
      current_user.cart += @product.id.to_s
    end
    current_user.save
    flash[:success_add] = 'Product added in your cart successfully!'
  end
end