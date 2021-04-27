class Manager::ProductsController < ApplicationController
   before_action :authenticate_manager!

  def index
    @products = Product.all.page(params[:page]).per(10)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to manager_product_path(@product)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to manager_product_path(@product)
  end

  private
  def product_params
    params.require(:product).permit(:genre_id,:name,:introduction,:price,:image,:is_active)
  end
end
