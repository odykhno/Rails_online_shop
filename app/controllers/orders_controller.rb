class OrdersController < ApplicationController
  require 'sendgrid-ruby'
  helper_method :create_order_list

  @sendgrid = SendGrid::Client.new do |c|
    c.api_key = 'SENDGRID_APIKEY'
  end

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

    email = SendGrid::Mail.new do |m|
      m.to      = @order.email
      m.from    = 'notifications@example.com'
      m.subject = 'List of products to buy'
      m.html    = "Your order contains next products: #{@order.orders_list}"
    end
    @sendgrid.send(email)
    default from: 'notifications@example.com'

    OrdersMailer.create_order(@order).deliver_now
    OrdersMailer.mail_for_admin(@order).deliver_now
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