class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger
  
  helper_method :current_advisor, :logged_in?
  
  before_action :get_categories
  
  def get_categories
    @categories = Category.all
  end
  
  def current_advisor
    @current_advisor ||= Advisor.find_by(id: session[:advisor_id])
  end

  def logged_in?
    !current_advisor.nil?
  end
end
