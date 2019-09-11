class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
      build_resource(sign_up_params)
      
      resource.save 
      render_resource(resource)
    end

    #private
    #  def sign_up_params
        # Reemplazamos :password_digest por :password y :password_confirmation
    #    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    #  end
  end