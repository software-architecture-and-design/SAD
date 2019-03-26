class ApplicationController < ActionController::Base
	
	rescue_from CanCan::AccessDenied do |exception|
	     	flash[:error] = "Access denied."
	        redirect_to root_url
	end

	before_action :status?

	def status?
    	if current_user.present? && current_user.status?
      		sign_out current_user
      		flash[:error] = "This account has been banned"
      		redirect_to root_url
    	end

  	end

	

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected 
	
    
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :name, :lastname, :major, :status, :remember_me])
    	devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
	end
end
