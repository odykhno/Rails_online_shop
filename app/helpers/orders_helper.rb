module OrdersHelper
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