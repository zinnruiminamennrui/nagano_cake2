class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: params[:cart_item][:quantity].to_i)
    redirect_to cart_items_path
  end

  def create
    @cart_item = current_customer.cart_items.new(params_cart_item)
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def params_cart_item
    params.require(:cart_item).permit(:quantity,:product_id)
  end
end