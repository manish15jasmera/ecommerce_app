class OrdersController < ApplicationController
  def show
    @order = current_user.orders.find(params[:id])
    @items = @order.order_items
      logger.debug "Order items: #{@items.inspect}"
  end

  def index
    @orders = current_user.orders
  end

  def checkout
    @cart = current_user.cart
    @order = current_user.orders.build(total_price: @cart.cart_items.sum { |item| item.quantity * item.price })
    @order.shipping_address = current_user.shipping_addresses.last
    @order.order_status = OrderStatus.find_by(name: 'pending') 
  end

  def create
    @cart = current_user.cart
    @order = current_user.orders.build(order_params)
    @order.total_price = @cart.cart_items.sum { |item| item.quantity * item.price }
    @order.status = 'pending'
    @order.order_status = OrderStatus.find_by(name: 'pending')
  
    if @order.save
      @cart.cart_items.each do |cart_item|
        @order.order_items.create!(
          product_id: cart_item.product_id,
          quantity: cart_item.quantity,
          price: cart_item.price
        )
        cart_item.update(order_id: @order.id) 
      end
  
      @cart.cart_items.destroy_all
  
      redirect_to order_path(@order), notice: 'Order successfully placed!'
    else
      render :new
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:shipping_address_id, :payment_method_id)
  end

  def order_status_params
    params.require(:order).permit(:order_status_id)
  end
end
