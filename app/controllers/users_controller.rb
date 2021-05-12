class UsersController < ApplicationController
  
  def index
    @users = User.all.order('created_at desc')
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end

  private 
  
  def user_params
    params.require(:user).permit(:name, :age, :cpf, :genero_id)
  end
  
end
