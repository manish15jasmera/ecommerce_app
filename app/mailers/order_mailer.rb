class OrderMailer < ApplicationMailer
  default from: 'no-reply@ecommerceapp.com'
  def order_confirmation(customer)
    @customer = customer
    @order = customer.orders.last 
    @order_items = @order.order_items

    mail(to: @customer.email, subject: 'Your Order Confirmation')
  end

  def new_order_notification(admin)
    @admin = admin
    @orders = Order.includes(:user, :order_status).order(created_at: :desc)

    mail(to: @admin.email, subject: 'New Order Placed')
  end
end
