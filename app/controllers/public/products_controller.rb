class Public::ProductsController < ApplicationController

  def index
    @products = Product.where(is_active: true)
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end
end
