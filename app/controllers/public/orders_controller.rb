class Public::OrdersController < ApplicationController

  def new
    @addressees = current_customer.addressees
    @order = Order.new
  end

  def confirmation
    @orders = current_customer.orders

  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to orders_confirmation_path
  end

  def complete
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment,:postage,:status)
  end

end
