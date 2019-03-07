class SessionsController < Devise::SessionsController

	protected

  	def after_sign_in_path_for(resource)
    	if resource.is_a?(User) && resource.status?
      		sign_out resource
      		flash[:error] = "This account has been banned now"
      		redirect_to root_url
    	else
      		super
    	end
   	end
end
