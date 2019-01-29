class ApplicationController < ActionController::Base

  before_action :configure_permitted_arameters, if: :devise_controller?
	before_action :authenticate_user!, except: [:top]

  def after_sign_in_path_for(resource)
		users_mypage_path(current_user.id)
	end

  private
  def configure_permitted_arameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :history_year, :history_month])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name, :history_year, :history_month, :introduction_text, :user_image])
  end
end
