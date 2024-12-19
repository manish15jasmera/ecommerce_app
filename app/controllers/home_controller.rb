class HomeController < ApplicationController
  def index
    @products = Product.where('stock > 0')
  end  
end
