class SessionsController < ApplicationController
  def new
  end
  
  def create
    advisor = Advisor.find_by(email: params[:session][:email])
    if advisor && advisor.authenticate(params[:session][:password])
      log_in advisor
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  private
  def advisor_params
    params.require(:session).permit(:email, :password)
  end
  
  def log_in(advisor)
    session[:advisor_id] = advisor.id
  end
end


