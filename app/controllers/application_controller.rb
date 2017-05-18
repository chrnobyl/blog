class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

private

  def current_user
    @current_user ||= User.find_by(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authorize_user
  if !logged_in?
    flash[:notice] = "Ah ah ah, you didn't say the magice word!"
    redirect_to login_path
  end
end

end
