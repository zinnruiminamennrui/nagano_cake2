class Manager::CustomersController < ApplicationController
    def index
        @customer = Customer.all.page(params[:page]).per(10)
    end
    def show
        @customer = Customer.find(params[:id])
    end
    def edit
        @customer = Customer.find(params[:id])
    end
    def update
        @customer = Customer.find(params[:id])
        @customer.update(customer_params)
        redirect_to manager_customer_path(@customer)
    end

    private
    def customer_params
       params.require(:customer).permit(:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:phone_number,:is_deleted)
    end
end
