class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.all 
  end  

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "Product created successfully."
    else
      render :new, alert: "Failed to create product."
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :category_id)
  end

  def authenticate_admin!
    redirect_to root_path, alert: "Access denied!" unless current_user&.admin?
  end
end
