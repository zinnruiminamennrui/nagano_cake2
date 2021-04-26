class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
      if current_customer
        root_path  #　指定したいパスに変更
      elsif current_manager
        manager_homes_path
      else
        customers_my_page_path  #　指定したいパスに変更
      end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :manager
      new_manager_session_path  #　指定したいパスに変更
    else
      root_path#　指定したいパスに変更
    end # ログアウト後に遷移するpathを設定
  end

 protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:phone_number])
    end
end
