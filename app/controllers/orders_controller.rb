class OrdersController < ApplicationController
  def checkout
    @cart = current_user.cart
    @order = current_user.orders.build(total_price: @cart.cart_items.sum { |item| item.quantity * item.price })
  end
end
