class AdvisorsController < ApplicationController
   before_action :authenticate_user,{only: [:edit, :update]}
   before_action :forbid_login_user,{only: [:new, :create]}
   before_action :ensure_correct_user,{only: [:edit, :update]}
  def new
    @advisor = Advisor.new
  end
  
  def create
    @advisor = Advisor.new(advisor_params)
    if @advisor.save
      session[:advisor_id] = @advisor.id
      redirect_to root_path, success: "advisorになりました"
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def show
    @advisor = Advisor.find_by(id: params[:id])
  end
  
  def edit
    @advisor = Advisor.find_by(id: params[:id])
  end
  
  def update
    @advisor = User.find_by(id: params[:id])
    @advisor.name = params[:name]
    @advisor.email = params[:email]
  end
  
  def ensure_correct_user
    if @current_advisor.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/articles/index")
    end
  end

  private
  def advisor_params
    params.require(:advisor).permit(:name, :email, :password, :password_confirmation)
  end
end