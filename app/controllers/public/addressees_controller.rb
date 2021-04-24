class Public::AddresseesController < ApplicationController

  def index
    @addressee = Addressee.new
    @addressees = current_customer.addressees
  end

  def create
    @addressee = Addressee.new(addressee_params)
    @addressee.customer_id = current_customer.id
    @addressee.save
    redirect_to addressees_path
  end

  def edit
    @addressee = Addressee.find(params[:id])
  end

  def update
    @addressee = Addressee.find(params[:id])
    @addressee.update(addressee_params)
    redirect_to addressees_path
  end

  def destroy
    @addressee = Addressee.find(params[:id])
    @addressee.destroy
    redirect_to addressees_path
  end

  private
  def addressee_params
    params.require(:addressee).permit(:name, :address, :postal_code)
  end
end
