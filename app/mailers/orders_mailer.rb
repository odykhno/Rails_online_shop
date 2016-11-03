class OrdersMailer < ApplicationMailer
  default :from => 'online-shop@example.com'

  def create_order(order)
    @order = order
    mail(to: @order.email, subject: 'List of products to buy')
  end

  def mail_for_admin(order)
    @order = order
    @admin = AdminUser.first
    mail(to: @admin.email, subject: 'List of bought products')
  end
end