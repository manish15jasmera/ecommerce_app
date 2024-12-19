class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id]) # Find the product by its ID
  end
end
