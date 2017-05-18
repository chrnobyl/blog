class UsersController < ApplicationController
  before_action :authorize_user, only: [:show]

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
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if params[:user][:password] == params[:user][:password_confirmation] && params[:user][:password] != ""
      @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user.delete
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :email)

    end
end
