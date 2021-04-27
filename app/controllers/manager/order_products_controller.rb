class Manager::OrderProductsController < ApplicationController

  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(order_product_params)
    if @order_product.making_status == "製作中"
      @order_product.order.update(status: "製作中")
    end

    if @order_product.order.order_products.all?{|order_product| order_product.making_status == "制作完了"}
        @order_product.order.update(status: "発送準備中")
    end
    redirect_to manager_order_path(@order_product.order.id)
  end

  private
	def order_product_params
		  params.require(:order_product).permit(:making_status)
	end
end
