class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @categories = Category.all
  end  

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: "Category created successfully."
    else
      render :new, alert: "Failed to create category."
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: "Category updated successfully."
    else
      render :edit, alert: "Failed to update category."
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to admin_categories_path, notice: "Category deleted successfully."
    else
      redirect_to admin_categories_path, alert: "Failed to delete category."
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def authenticate_admin!
    redirect_to root_path, alert: "Access denied!" unless current_user&.admin?
  end
end
