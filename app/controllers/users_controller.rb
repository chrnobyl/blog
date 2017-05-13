class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

    def user_params
      params.require(:user)permit(:name, :password, :email)

    end
end
