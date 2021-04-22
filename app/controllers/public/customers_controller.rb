class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_my_page_path
  end
  
  def hide
    @customer = current_customer
      #is_deletedカラムにフラグを立てる(defaultはfalse)
    @customer.update(is_deleted: true)
      #ログアウトさせる
    reset_session
      flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:phone_number)
  end

end
