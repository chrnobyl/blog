class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.new(user_params)
      @user.save
    if @user.valid?
      # @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Invalid credentials!, please try again"
      redirect_to new_user_path
    end
    else
      flash[:notice] = "Invalid credentials, please try again"
      redirect_to new_user_path
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
