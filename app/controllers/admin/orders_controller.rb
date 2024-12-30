module Admin
  class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :edit, :update]

    def index
      @orders = Order.includes(:user, :order_status).order(created_at: :desc)
    end

    def show
      @items = @order.order_items.includes(:product)
    end

    def edit
      # Render edit view
    end

    def update
      if @order.update(order_params)
        redirect_to admin_order_path(@order), notice: 'Order updated successfully.'
      else
        render :edit, alert: 'Failed to update the order.'
      end
    end

    private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:order_status_id)
    end
  end
end
