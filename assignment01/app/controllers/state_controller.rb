class StateController < ApplicationController
    def userlists
       
        @allUser = User.all
    end
   

    
end
