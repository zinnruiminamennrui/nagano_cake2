class Public::OrdersController < ApplicationController

  def new
    @addressees = current_customer.addressees
    @order = Order.new
  end

  def confirmation
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    flash[:notice] = "ご注文が確定しました。"
    redirect_to thanx_customers_orders_path

    # もし情報入力でnew_addressの場合ShippingAddressに保存
    if params[:order][:ship] == "1"
      current_customer.shipping_address.create(address_params)
    end
  end

  def complete
  end

  def index
  end

  def show
  end

end
