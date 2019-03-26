class RegistrationsController < Devise::RegistrationsController
    def edit
        @user = User.find(params[:id])
    end

end
