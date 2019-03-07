class UserfacadeController < ApplicationController

    def userhandler
        if user_signed_in? 
            if current_user.role.name == "admin"
                redirect_to '/admin'
            elsif current_user.role.name == "instructor"
                redirect_to :controller => 'courses', :action => 'index'
			else
				redirect_to :controller => 'courses', :action => 'index'
			end
        else 
            redirect_to :controller => 'userfacade', :action => 'homepage'
		end
    end

    def homepage
        
    end 
end
