class AdvisorsController < ApplicationController
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

    if params[:image]
      @advisor.image_name = "#{@advisor.id}.jpg"
      image = params[:image]
      File.binwrite("public/assets/#{@user.image_name}", image.read)
    end
  end
  
  private
  def advisor_params
    params.require(:advisor).permit(:name, :email, :password, :password_confirmation,:image_name)
  end
end