class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirmation
    @order = Order.new(payment_method: params[:order][:payment_method])
    # ご自身の住所
    if params[:order][:address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address     = current_customer.address
      @order.name        = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address] == "2"
      customer_addressee = Addressee.find(params[:order][:address])
      @order.postal_code = customer_addressee.postal_code
      @order.address     = customer_addressee.address
      @order.name        = customer_addressee.name
    end
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
