class SessionsController < ApplicationController

  def new

  end

  def create
    byebug
    @session = User.find_by(params[:user][:username])
  end


end
