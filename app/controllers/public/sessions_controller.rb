class Public::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?
   before_action :user_status, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]
  
  def after_sign_in_path_for(resource)
    homes_about_path
  end


  
  def after_sign_out_path_for(resource)
    root_path
  end
  
    
  def guest_sign_in
   def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: "guestuserでログインしました。"
   end
  end


    protected
    
  def user_status
    return if params[:user].nil?
    user = User.find_by(email: params[:email])
    return if user.nil?
    return unless user.valid_password?(params[:user][:password])
    unless user.is_active?
      flash[:alert] = "退会済みです。別のメールアドレスをお使いください。"
      redirect_to new_user_session_path
    end
  end
  
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
