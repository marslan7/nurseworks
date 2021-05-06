class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_search_controller
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone])
    end

    def set_search_controller
      @search_controller = params[:controller] != "home" ? params[:controller] : "support_requests" 
    end
  
end
