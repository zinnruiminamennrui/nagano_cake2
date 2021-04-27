class Manager::HomesController < ApplicationController
  def top
   @orders = Order.all
   #@orders = Order.where(customer_id:  )

  end
end

