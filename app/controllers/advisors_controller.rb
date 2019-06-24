class AdvisorsController < ApplicationController
  def new
    @advisor = Advisor.new
  end
  
  def create
    @advisor = Advisor.new(name: params[:advisor][:name], email: params[:advisor][:email], password: params[:advisor][:password], password_confirmation: params[:advisor][:password_confirmation])
    if @advisor.save
      redirect_to root_path, success: "advisorになりました"
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  private
  def advisor_params
    params.require(:advisor).permit(:name, :email, :password, :password_confirmation)
  end
end