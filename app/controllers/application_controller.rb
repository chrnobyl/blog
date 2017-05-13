class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end

private

  def current_user
    @current_user ||= User.find_by(session[:user_id])
  end
