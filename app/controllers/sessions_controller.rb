class SessionsController < ApplicationController
  before_action :logged_in?, except: [:new, :create]

  def new
  end

  def create
    # byebug
    @user = User.find_by(username: params[:user][:username])
    if !@user.nil? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Invalid credentials, please try again"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
  
end
