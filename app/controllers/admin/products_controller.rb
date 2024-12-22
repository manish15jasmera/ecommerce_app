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

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "Product updated successfully."
    else
      render :edit, alert: "Failed to update product."
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to admin_categories_path, notice: "Product deleted successfully."
    else
      redirect_to admin_categories_path, alert: "Failed to delete category."
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :category_id, images: [])
  end

  def authenticate_admin!
    redirect_to root_path, alert: "Access denied!" unless current_user&.admin?
  end
end
