class Manager::OrderProductsController < ApplicationController

  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(order_product_params)
    redirect_to manager_order_path(@order_product.order.id)
  end

  private
	def order_product_params
		  params.require(:order_product).permit(:making_status)
	end
end
