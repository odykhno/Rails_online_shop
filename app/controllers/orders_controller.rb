class OrdersController < ApplicationController
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
  end

  private
  def order_params
    params.require(:order).permit(:email, :phone_number)
  end
end