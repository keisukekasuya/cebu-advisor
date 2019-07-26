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
  
  def authenticate_user
    if current_advisor == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end
  
  def forbid_login_user
    if @current_advisor
      flash[:notice] = "既にログインしています"
      redirect_to("/articles/index")
    end
  end
end
