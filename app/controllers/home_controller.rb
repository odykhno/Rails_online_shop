class HomeController < ApplicationController
  def index
    @products = Product.find_by_sql('SELECT * FROM products ORDER BY RAND() LIMIT 25')
  end
end
