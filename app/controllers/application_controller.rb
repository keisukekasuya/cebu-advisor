class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger
  
  helper_method :current_user, :logged_in?
  
  def current_advisor
    @current_advisor ||= Advisor.find_by(id: session[:advisor_id])
  end

  def logged_in?
    !current_advisor.nil?
  end
end
