class CartItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_cart, only: [:create, :update, :destroy]

  def create
    # Check if the user is logged in
    unless user_signed_in?
      redirect_to new_user_session_path, alert: 'Please log in to add items to your cart.'
      return
    end

    product = Product.find(params[:product_id])
    cart_item = @cart.cart_items.find_or_initialize_by(product: product)
    cart_item.quantity = (cart_item.quantity || 0) + params[:quantity].to_i
    cart_item.price = product.price

    if cart_item.save
      redirect_to cart_path, notice: 'Product added to cart.'
    else
      redirect_to product_path(product), alert: 'Unable to add product to cart.'
    end
  end

  def update
    cart_item = @cart.cart_items.find(params[:id])
    if cart_item.update(cart_item_params)
      redirect_to cart_path, notice: 'Cart updated.'
    else
      redirect_to cart_path, alert: 'Unable to update cart.'
    end
  end

  def destroy
    cart_item = @cart.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to cart_path, notice: 'Item removed from cart.'
  end

  private

  def set_cart
    # Ensure user is logged in before accessing the cart
    if user_signed_in?
      @cart = current_user.cart
    else
      redirect_to new_user_session_path, alert: 'You need to log in to access your cart.'
    end
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
