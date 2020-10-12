class UsersController < ApplicationController
  def index
    @users = User.page params[:page]
  end

  def new
    @user = User.new
  end

  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You are successfully registered #{@user.username}"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your account has been updated successfully"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
