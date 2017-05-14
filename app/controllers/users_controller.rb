class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if params[:password] == params[:password_confirmation]
      @user = User.new(user_params)
    else
      flash[:notice] = "Please enter a valid name, password, and email"
      redirect_to login_path
    end
    if !@user.nil?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

  def show
    # byebug
    @user = User.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :email)

    end
end
