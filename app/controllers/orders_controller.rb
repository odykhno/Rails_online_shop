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
        format.html do
          redirect_to users_show_cart_path
          flash[:errors] = 'The form has been filled in incorrectly!!!'
        end
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
end