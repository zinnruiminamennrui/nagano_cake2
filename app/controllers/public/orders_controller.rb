class Public::OrdersController < ApplicationController
  include ApplicationHelper

  def new
    @order = Order.new
    @addressee = current_customer.addressees

  end

  def confirmation
    @orders = current_customer.orders
    @order = Order.new(payment_method: params[:order][:payment_method])
    @order.total_payment = billing(@order)
    # ご自身の住所
    if params[:address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address     = current_customer.address
      @order.name        = current_customer.last_name + current_customer.first_name
    elsif params[:address] == "2"
      customer_addressee = Addressee.find(params[:order][:addressees_id])
      @order.postal_code = customer_addressee.postal_code
      @order.address     = customer_addressee.address
      @order.name        = customer_addressee.name
    elsif params[:address] == "3"
      @order.postal_code = params[:order][:postal_code]
      @order.address     = params[:order][:address]
      @order.name        = params[:order][:name]
    end
    @cart_items = current_customer.cart_items

  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to orders_complete_path

    @cart_items = current_cart
    @cart_items.each do |cart_item|
      OrderProduct.create(
      product:  cart_item.product,
      order:    @order,
      quantity: cart_item.quantity,
      price: sub_price(cart_item)
      )
    end

    @cart_items.destroy_all

  end

  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment,:postage,:status)
  end


end
