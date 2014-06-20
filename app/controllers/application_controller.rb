class ApplicationController < ActionController::Base

  def log_user_in(user)
    session[:id] = user.id
  end

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
