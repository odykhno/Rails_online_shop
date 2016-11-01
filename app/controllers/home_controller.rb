class HomeController < ApplicationController
  def index
    @products = Product.find_by_sql('SELECT * FROM products ORDER BY RAND() LIMIT 25')
    # @products1 = @products2 = @products3 = @products4 = @products5 = []
    # @products.each_index do |i|
    #   @products1 << @products[i] if i in 0..4
    #   @products2 << @products[i] if i in 5..9
    #   @products3 << @products[i] if i in 9..14
    #   @products4 << @products[i] if i in 15..19
    #   @products5 << @products[i] if i in 20..24
    # end
    @products1 = @products.values_at(0..4)
    @products2 = @products.values_at(5..9)
    @products3 = @products.values_at(10..14)
    @products4 = @products.values_at(15..19)
    @products5 = @products.values_at(20..24)
  end
end
