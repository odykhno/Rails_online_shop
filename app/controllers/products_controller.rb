class ProductsController < ApplicationController
  def index
    @products = Product.all.page params[:page]
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
  end
end