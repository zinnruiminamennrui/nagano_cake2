class Manager::OrdersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "入金確認"
      @order.order_products.update(making_status: "制作待ち")
    end

    # if @order.status == "製作中"
    #   @order.order_products.update(making_status: "製作中")
    # end
    redirect_to manager_order_path(@order)
  end

 private
	def order_params
		  params.require(:order).permit(:status)
	end
end
