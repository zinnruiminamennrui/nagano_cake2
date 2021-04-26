class Manager::OrdersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to manager_order_path(@order)
  end

 private
	def order_params
		  params.require(:order).permit(:status)
	end
end
