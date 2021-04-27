class Manager::HomesController < ApplicationController
  def top
    
   @orders = Order.all

 end
end

