class Public::OrdersController < ApplicationController

  def new
    @addressees = current_customer.addressees
    @order = Order.new
  end

  def confirmation
  end

  def create
  end

  def complete
  end

  def index
  end

  def show
  end

end
