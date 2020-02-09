class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
       admin_orders_top_path
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :family_name_kana, :last_name, :last_name_kana, :post_code, :telephone_number, :address])
    end
end
