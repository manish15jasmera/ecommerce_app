# app/mailers/order_mailer.rb
class OrderMailer < ApplicationMailer
  default from: 'no-reply@ecommerceapp.com'

  # Email to the customer after order is placed
  def order_confirmation(customer)
    @customer = customer
    @order = customer.orders.last # Assuming the last order is the one just placed
    @order_items = @order.order_items

    mail(to: @customer.email, subject: 'Your Order Confirmation')
  end

  # Email to the admin when an order is placed
  def new_order_notification(admin)
    @admin = admin
    @orders = Order.includes(:user, :order_status).order(created_at: :desc)

    mail(to: @admin.email, subject: 'New Order Placed')
  end
end
