class OrdersController < ApplicationController
  helper_method :create_order_list

  def show_form
    render 'new'
  end

  def create
    @orders = create_order_list(current_user)
    @order = current_user.orders.new(order_params.merge(orders_list: @orders))
    respond_to do |format|
      if @order.save
        format.html { redirect_to users_show_cart_path }
        format.json { render json: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
    OrdersMailer.create_order(@order).deliver
    OrdersMailer.mail_for_admin(@order).deliver
  end

  private
  def order_params
    params.require(:order).permit(:email, :phone_number)
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