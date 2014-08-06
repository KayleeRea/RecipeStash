class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception


  def ensure_current_user
    redirect_to root_path unless current_user
  end

  helper_method :current_user

  private

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      nil
    end

  end

end
