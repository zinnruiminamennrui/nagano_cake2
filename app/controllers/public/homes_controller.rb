class Public::HomesController < ApplicationController
    def top
     @products = Product.all.order(created_at: :desc)
    end

    def about
    end
end
