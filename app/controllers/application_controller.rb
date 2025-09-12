class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top], unless: :admin_controller? 
  
  
  private
 
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end
  
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:password]) #account_updateにつづいて編集・変更したいカラム名を入れる。
  end  
 

end