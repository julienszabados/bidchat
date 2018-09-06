class SessionsController < Devise::SessionsController

  layout "layouts/sign_in_layout"
  
  # POST /resource/sign_in
  def create
    if (user = User.find_by_email(user_params[:email]))
      if user.valid_password?(user_params[:password])        
        sign_in user
        redirect_to after_sign_in_path_for(user)
      else
        redirect_back fallback_location: '/users/sign_in', alert: "Erreur d'authentification"
      end
    else
      redirect_back fallback_location: '/users/sign_in', alert: "Erreur d'authentification"
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  private

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
  
  def user_params
    params.require(:user).permit(
      :email,
      :password
    )
  end
    
end
